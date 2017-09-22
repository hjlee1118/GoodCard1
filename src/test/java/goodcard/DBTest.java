package goodcard;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.goodcard.service.MemberService;
import kr.co.goodcard.vo.Member;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/**/*.xml"})
public class DBTest {

	@Autowired
	MemberService memberService;

	@Test
	
	public void 회원가입테스트() throws Exception {
		Member member = new Member();
		member.setId("jawan727");
		member.setPassword("1234");
		member.setName("김짱완");
		member.setPhone("010-3932-7270");
		member.setEmail("wanja727@naver.com");
		memberService.insertMember(member);
		System.out.println("입력완료");
	}

}
