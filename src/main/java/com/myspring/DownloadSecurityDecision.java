package com.myspring;

import java.util.Collection;
import java.util.List;

import org.springframework.security.access.AccessDecisionVoter;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.vote.AbstractAccessDecisionManager;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.util.CollectionUtils;

public class DownloadSecurityDecision extends AbstractAccessDecisionManager{

	protected DownloadSecurityDecision(List<AccessDecisionVoter<? extends Object>> decisionVoters) {
		super(decisionVoters);
		// TODO Auto-generated constructor stub
	}

	public void decide(Authentication authentication, Object object, Collection<ConfigAttribute> configAttributes)
			throws AccessDeniedException, InsufficientAuthenticationException {
		// TODO Auto-generated method stub
		if (! CollectionUtils.containsAny(authentication.getAuthorities(), configAttributes))
			throw new AccessDeniedException(object.toString());

		return;
	}

}
