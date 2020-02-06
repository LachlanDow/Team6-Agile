/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DatabaseConnection;

import java.sql.Statement;
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

    /**
     * Test of getData method, of class ListProcedures.
     */
    @Test
    public void testGetProcedures() {
        ListProcedures lp = new ListProcedures();
        Object[][] results = lp.getLocations();
        System.out.println(results.length);
        for (int i = 0; i < results.length; i++) {
            System.out.println(results[i][0]);
            System.out.println(results[i][1]);
        }
    }
    
}
