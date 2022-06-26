package com.example.acessogeodb;

public class Metadata {
    public int getCurrentOffset() {
        return this.currentOffset;
    }

    public void setCurrentOffset(int currentOffset) {
        this.currentOffset = currentOffset;
    }

    int currentOffset;

    public int getTotalCount() {
        return this.totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    int totalCount;
}
