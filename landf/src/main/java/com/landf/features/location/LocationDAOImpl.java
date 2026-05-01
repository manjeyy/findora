package com.landf.features.location;

import com.landf.features.database.ConnectionManager;

import java.util.ArrayList;

public class LocationDAOImpl implements  LocationDAO{

    private final ConnectionManager connectionManager;

    public LocationDAOImpl() {
        this(new ConnectionManager());
    }

    public LocationDAOImpl(ConnectionManager connectionManager) {
        this.connectionManager = connectionManager;
    }

    @Override
    public ArrayList<LocationModel> getAllLocations() {
        return null;
    }

    @Override
    public LocationModel getLocationById(int id) {
        return null;
    }

    @Override
    public LocationModel getLocationByName(String name) {
        return null;
    }
}
