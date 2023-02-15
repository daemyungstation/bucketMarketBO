package bucketMarketBO;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import web.batch.service.BatchManagerService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:egovframework/spring/context-*.xml" })
public class OrderRmtViewTest {
    
    @Resource(name="batchManagerService")
    private BatchManagerService batchManagerService;
    
    @Test
    public void run(){
        
        try {
            
            batchManagerService.doJob09();
          
        } catch(Exception e) {
            
            e.printStackTrace();
            
        }
    }
}
