package com.hoteldirectory.connectivity;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import com.hoteldirectory.model.City;

public class CityDAOImpl implements CityDAO {
	private JdbcTemplate jdbcTemplate;
	
	public CityDAOImpl() {
		// TODO Auto-generated constructor stub
	}
	
	public CityDAOImpl(DataSource dataSource) {
	    jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public City get(int Id) {
		String sql = "SELECT * FROM tblcity WHERE id=" + Id +"";
	    return jdbcTemplate.query(sql, new ResultSetExtractor<City>() {
	 
	        public City extractData(ResultSet rs) throws SQLException,
	                DataAccessException {
	            if (rs.next()) {
	                City city = new City();
	                city.setId(rs.getInt("id"));
	                city.setName(rs.getString("name"));
	                city.setCode(rs.getString("code"));
	         
	                return city;
	            }
	 
	            return null;
	        }
	 
	    });
	}

	public List<City> list() {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM tblcity WHERE Status != 0";
	    List<City> listCity = jdbcTemplate.query(sql, new RowMapper<City>() {
	 
	        public City mapRow(ResultSet rs, int rowNum) throws SQLException {
	            City city = new City();
	 
	            city.setId(rs.getInt("id"));
	            city.setName(rs.getString("name"));
	            city.setCode(rs.getString("code"));
	 
	            return city;
	        }
	 
	    });
		return listCity;
	}

}
