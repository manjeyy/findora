package com.landf.features.location;

import java.util.ArrayList;

public interface LocationDAO {
    public ArrayList<LocationModel> getAllLocations();
    public LocationModel getLocationById(int id);
    public LocationModel getLocationByName(String name);
}
