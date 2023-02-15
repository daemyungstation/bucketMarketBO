package bucketMarketBO;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import web.batch.service.BatchManagerService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:egovframework/spring/context-*.xml" })
public class OrderDpsViewTest {
    
    @Resource(name="batchManagerService")
    private BatchManagerService batchManagerService;
    
    @Test
    public void run(){
        
        try {
            
            batchManagerService.doJob05De1();
            
            //      System.out.println( DateUtil.addMonth(DateUtil.getToday(), -1).substring(0,6) );

        } catch(Exception e) {
            
            e.printStackTrace();
            
        }
    }
}
