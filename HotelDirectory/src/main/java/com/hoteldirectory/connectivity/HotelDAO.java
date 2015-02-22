package com.hoteldirectory.connectivity;

import java.util.List;

import com.hoteldirectory.model.Hotel;
 
/**
 * Defines Data Access Object (DAO) operations for the Hotel.
 * 
 */

public interface HotelDAO {
	public void saveOrUpdate(Hotel hotel);
    
    public void delete(int Id);
     
    public Hotel get(int Id);
     
    public List<Hotel> list();
    
    public List<Hotel> listSearch(String city);

}
