package DatabaseConnection;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 * @author Cameron McNeill
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
    public void testGetDistance() {
        System.out.println("getDistance");
        DistanceCalculator dc = new DistanceCalculator();
        double result = dc.getDistance(40.81, -73.04, 18.16, -66.72);
        assertEquals(2590, result, 1);
    }
    
    @Test
    public void testGetDistanceList() {
        System.out.println("getDistanceList");
        DistanceCalculator dc = new DistanceCalculator();
        ListProcedures lp = new ListProcedures();
        Object[][] results = dc.getDistanceList(lp.getData("023"), 56.45, -2.98);
        assertNotNull(results);
        assertEquals(6714, Double.parseDouble(results[1][4].toString()), 1);
    }
    
    @Test
    public void testGetDistanceListWithZipcode() {
        System.out.println("getDistanceListWithZipcode");
        DistanceCalculator dc = new DistanceCalculator();
        ListProcedures lp = new ListProcedures();
        Object[][] results = dc.getDistanceList(lp.getData("023"), 501);       
        assertNotNull(results);
        assertEquals(1537, Double.parseDouble(results[1][4].toString()), 1);
    }
}
