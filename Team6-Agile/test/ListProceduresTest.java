/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author cameronmcneill
 */
public class ListProceduresTest {
    
    public ListProceduresTest() {
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
    public void restConnectionToDatabase() {
        System.out.println("Test Connection To Database");
        ListProcedures lp = new ListProcedures();
        boolean result = lp.connectToDatabase();
        assertTrue("Failed to connect to database", result);
    }
    
//    @Test
//    public void restConnectToDatabase() {
//        System.out.println("Test Database Connection");
//        ListProcedures lp = new ListProcedures();
//        boolean result = lp.connectToDatabase();
//        assertTrue("Failed to connect to database", result);
//    }
    
}
