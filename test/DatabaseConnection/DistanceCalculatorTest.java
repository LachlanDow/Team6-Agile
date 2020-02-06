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

    /**
     * Test of getString method, of class DistanceCalculator.
     */
    @Test
    public void Test01() {
        ListProcedures lp = new ListProcedures();
        DistanceCalculator dc = new DistanceCalculator();
        
        Object[][] results = dc.getDistanceList(lp.getData("032"), 501);
        System.out.println(results.length);
        for (int i = 0; i < results.length; i++) {
            System.out.println(Double.parseDouble(results[i][4].toString()));
            System.out.println();
        }
    }
    
}
