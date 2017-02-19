package cn.elvea.core.actor.enums;

/**
 * 行为人类型
 */
public enum ActorType {
    DPT(1, "DPT", "部门"),
    PST(2, "PST", "岗位"),
    USR(3, "USR", "用户");

    // 类型
    private final int type;
    // 编号
    private final String code;
    // 描述
    private final String desc;

    ActorType(final int type, final String code, final String desc) {
        this.type = type;
        this.code = code;
        this.desc = desc;
    }

    public static ActorType getActorType(int type) {
        ActorType[] ts = ActorType.values();
        for (ActorType t : ts) {
            if (t.getType() == type) {
                return t;
            }
        }
        return USR;
    }

    public int getType() {
        return type;
    }

    public String getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }
}
