package com.lee.chatter.model;

public class Matchmessage {
    private String type;
    private String timestamp;

    public Matchmessage(String type, String timestamp) {
        this.type = type;
        this.timestamp = timestamp;
    }

    // Getters and setters (if needed)

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }
}
