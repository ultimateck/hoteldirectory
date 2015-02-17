package com.hoteldirectory.connectivity;

import java.util.List;

import com.hoteldirectory.model.City;

/**
 * Defines Data Access Object (DAO) operations for the City.
 * 
 */

public interface CityDAO {
	
	public City get(int Id);
    
    public List<City> list();

}
