package com.myspring.sbp.member.controller;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.assertThat;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.google.gson.Gson;
import com.myspring.sbp.member.service.MemberServiceImpl;
import com.myspring.sbp.member.vo.MemberVO;

@ExtendWith(MockitoExtension.class)
public class MemberControllerTest {
	@InjectMocks
	private MemberControllerImpl memberController;

	@Mock
	private MemberServiceImpl memberService;

	private MockMvc mockMvc;

	@BeforeEach
	public void init() {
		mockMvc = MockMvcBuilders.standaloneSetup(memberController).build();
	}

	private MemberVO memberVO() {
		final MemberVO memberVO = new MemberVO();
		memberVO.setId("testId");
		memberVO.setPwd("testPwd");
		memberVO.setName("testName");
		memberVO.setEmail("test@email.com");
		return memberVO;
	}

	@DisplayName("회원 가입 성공")
	@Test
	void addMemberSuccess() throws Exception {
		// given
		final MemberVO memberVO = memberVO();

		// when
		final ResultActions resultActions = mockMvc.perform(MockMvcRequestBuilders.post("/member/addMember.do")
				.contentType(MediaType.APPLICATION_JSON).content(new Gson().toJson(memberVO)));

		// then
		final MvcResult mvcResult = resultActions.andExpect(status().isOk()).andReturn();
		final MockHttpServletResponse response = mvcResult.getResponse();
		assertThat(response, is(notNullValue()));
	}

}
