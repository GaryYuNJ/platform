package cn.elvea.core.actor.enums;

/**
 * 行为人关联类型
 */
public enum RelationType {
    // 部门-部门
    DPT_PARENT_DPT("DPT_PARENT_DPT", "部门-部门"),
    // 岗位-岗位
    PST_PARENT_PST("PST_PARENT_PST", "岗位-岗位"),
    // 岗位-部门
    PST_PARENT_DPT("PST_PARENT_DPT", "岗位-部门"),
    // 用户-部门
    USR_CURRENT_DPT("USR_CURRENT_DPT", "用户-部门"),
    // 用户-岗位
    USR_CURRENT_PST("USR_CURRENT_PST", "用户-岗位");

    // 类型
    private final String type;
    // 描述
    private final String desc;

    RelationType(final String type, final String desc) {
        this.type = type;
        this.desc = desc;
    }

    public static RelationType getRelationType(String type) {
        RelationType[] ts = RelationType.values();
        for (RelationType t : ts) {
            if (t.getType().equalsIgnoreCase(type)) {
                return t;
            }
        }
        return null;
    }

    public String getType() {
        return this.type;
    }

    public String getDesc() {
        return this.desc;
    }
}
