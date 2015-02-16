package com.hoteldirectory.connectivity;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
 
import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import com.hoteldirectory.model.Hotel;

public class HotelDAOImpl implements HotelDAO {
	private JdbcTemplate jdbcTemplate;
	
	public HotelDAOImpl(){
		
	}
	
	public HotelDAOImpl(DataSource dataSource) {
	    jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public void saveOrUpdate(Hotel hotel) {
		// TODO Auto-generated method stub
		if (hotel.getId() > 0) {
	        // update
	        String sql = "UPDATE tblhotel SET name=?, city=?, address=?, "
	                    + " WHERE id=?";
	        jdbcTemplate.update(sql, hotel.getName(), hotel.getCity(),
	                hotel.getAddress(), hotel.getId());
	    } else {
	        // insert
	        String sql = "INSERT INTO tblhotel (name, address, city)"
	                    + " VALUES (?, ?, ?)";
	        jdbcTemplate.update(sql, hotel.getName(),
	                hotel.getAddress(), hotel.getCity());
	    }

	}

	public void delete(int Id) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM tblhotel WHERE id=?";
	    jdbcTemplate.update(sql, Id);

	}

	public Hotel get(int Id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM tblhotel WHERE id=" + Id;
	    return jdbcTemplate.query(sql, new ResultSetExtractor<Hotel>() {
	 
	        public Hotel extractData(ResultSet rs) throws SQLException,
	                DataAccessException {
	            if (rs.next()) {
	                Hotel hotel = new Hotel();
	                hotel.setId(rs.getInt("id"));
	                hotel.setName(rs.getString("name"));
	                hotel.setAddress(rs.getString("address"));
	                hotel.setCity(rs.getInt("city"));
	                return hotel;
	            }
	 
	            return null;
	        }
	 
	    });
	}

	public List<Hotel> list() {
		// TODO Auto-generated method stub
		
		String sql = "SELECT * FROM tblhotel";
	    List<Hotel> listHotel = jdbcTemplate.query(sql, new RowMapper<Hotel>() {
	 
	        public Hotel mapRow(ResultSet rs, int rowNum) throws SQLException {
	            Hotel aHotel = new Hotel();
	 
	            aHotel.setId(rs.getInt("id"));
	            aHotel.setName(rs.getString("name"));
	            aHotel.setAddress(rs.getString("address"));
	            aHotel.setCity(rs.getInt("city"));
	 
	            return aHotel;
	        }
	 
	    });
		return listHotel;
	}

}
