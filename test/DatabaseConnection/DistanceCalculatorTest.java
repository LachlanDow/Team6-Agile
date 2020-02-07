/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DatabaseConnection;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author camer
 */
public class DistanceCalculatorTest {
    
    public DistanceCalculatorTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    
    
    
    
    
    
    
    @Test
    public void TestGetLatLong() {
        System.out.println("Get Lat Long");
        
        DistanceCalculator dc = new DistanceCalculator();
        
        double[] output = dc.getLatLong(501);
        
        double expLat = 40.81;
        double expLong = -73.04;
        
        assertEquals(expLat, output[0], 0);
        assertEquals(expLong, output[1], 0);
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
