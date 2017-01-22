package cn.elvea.core.actor.service;

import cn.elvea.commons.service.BaseEntityService;
import cn.elvea.core.actor.domain.Actor;
import cn.elvea.core.actor.domain.ActorRelation;
import cn.elvea.core.actor.mapper.ActorMapper;
import cn.elvea.core.actor.mapper.ActorRelationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ActorService extends BaseEntityService<ActorMapper, Actor> {
    @Autowired
    ActorRelationMapper actorRelationMapper;

    /**
     * 保持实体关联
     *
     * @param id       子节点ID
     * @param parentId 父节点ID
     * @param type     关联类型
     */
    public void saveOrUpdateRelations(long id, long parentId, String type) {
        if (parentId <= 0 || id <= 0) {
            return;
        }

        // 先删除已有关联
        this.delAsChild(id, type);

        // 首先增加上级的上级
        int level = 0;
        List<ActorRelation> list = getParents(parentId, type);
        if (!list.isEmpty()) {
            for (ActorRelation r : list) {
                level++;

                ActorRelation relation = new ActorRelation();
                relation.setId(generateNextId());
                relation.setType(type);
                relation.setParentId(r.getParentId());
                relation.setChildId(id);
                relation.setLevel(level);
                relation.setParentInd(false);

                actorRelationMapper.insert(relation);
            }
        }

        // 增加直属上级
        level++;

        ActorRelation relation = new ActorRelation();
        relation.setId(generateNextId());
        relation.setType(type);
        relation.setParentId(parentId);
        relation.setChildId(id);
        relation.setLevel(level);
        relation.setParentInd(true);

        actorRelationMapper.insert(relation);
    }

    public List<ActorRelation> getRelations(String type, long parentId, long childId) {
        return actorRelationMapper.getRelations(type, parentId, childId);
    }

    public List<ActorRelation> getParents(long childId, String type) {
        return actorRelationMapper.getRelations(type, 0, childId);
    }

    public List<ActorRelation> getChilds(long parentId, String type) {
        return actorRelationMapper.getRelations(type, parentId, 0);
    }

    public void delAsParent(long id, String type) {

    }

    public void delAsChild(long id, String type) {

    }
}
