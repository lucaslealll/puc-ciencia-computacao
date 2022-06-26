package com.example.acessogeodb;

import java.util.ArrayList;

public class RootData {
    public ArrayList<DadosCidade> getData() {
        return this.data;
    }

    public void setData(ArrayList<DadosCidade> data) {
        this.data = data;
    }

    ArrayList<DadosCidade> data;

    public Metadata getMetadata() {
        return this.metadata;
    }

    public void setMetadata(Metadata metadata) {
        this.metadata = metadata;
    }

    Metadata metadata;
}
