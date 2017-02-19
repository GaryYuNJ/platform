package cn.elvea.core.common.enums;

/**
 * 状态类型
 */
public enum StatusType {
    ENABLE(1, "超级管理员"),
    DISABLE(2, "管理员");

    // 类型
    private final int type;
    // 描述
    private final String desc;

    StatusType(final int type, final String desc) {
        this.type = type;
        this.desc = desc;
    }

    public static StatusType getStatusType(int type) {
        StatusType[] ts = StatusType.values();
        for (StatusType t : ts) {
            if (t.getType() == type) {
                return t;
            }
        }
        return DISABLE;
    }

    public int getType() {
        return type;
    }

    public String getDesc() {
        return desc;
    }
}
