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

import java.sql.*;

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
    public void testGetConnection() {
        System.out.println("Test Connection To Database");
        ListProcedures lp = new ListProcedures();
        Statement results = lp.getConnection();        
        assertNotNull(results);
    }

    @Test
    public void testSearchWithCode() {
        System.out.println("Test Retreive Data From Database by Code");
        ListProcedures lp = new ListProcedures();
        String[][] results = lp.searchWithCode("023");
        printData(results);
        assertNotNull(results);
    }
    
    @Test
    public void testSearchWithCodeDataExample() {
        System.out.println("Test Retreive Data From Database With Sample");
        ListProcedures lp = new ListProcedures();
        String[][] results = lp.searchWithCode("023");
        printData(results);
        assertEquals("Value returned was not what was wanted",
                     "023 - CRANIOTOMY W MAJOR DEVICE IMPLANT OR ACUTE CNS PDX W MCC OR CHEMOTHE",
                     results[0][0]);
    }
    

    
    @Test
    public void testSearchWithName() {
        System.out.println("Test Retreive Data From Database by Name");
        ListProcedures lp = new ListProcedures();
        String[][] results = lp.searchWithName("CRANIOTOMY");
        printData(results);
        assertNotNull(results);
    }
    
//    @Test
//    public void testlistAll(){
//        ListProcedures lp = new ListProcedures();
//        String[][] results = lp.listAll();
//        printData(results);
//        assertNotNull(results);
//    }
   
    
    public void printData(String[][] output) {
        for (int i = 0; i < output.length; i++) {
            for(int j = 0; j < 7 ; j++){
                System.out.println(output[i][j]);
            }
            System.out.println();
        }
    }
}
