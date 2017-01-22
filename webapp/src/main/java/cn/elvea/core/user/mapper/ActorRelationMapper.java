package cn.elvea.core.user.mapper;

import cn.elvea.commons.persistence.mybatis.BaseEntityMapper;
import cn.elvea.core.user.domain.ActorRelation;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ActorRelationMapper extends BaseEntityMapper<ActorRelation> {
    List<ActorRelation> getRelations(@Param("type") String type,
                                     @Param("parentId") long parentId,
                                     @Param("childId") long childId);

    int delAsChild(@Param("type") String type, @Param("childId") long childId);

    int delAsParent(@Param("type") String type, @Param("parentId") long parentId);
}
