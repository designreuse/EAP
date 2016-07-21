package com.journaldev.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.MessageDAO;
import com.journaldev.spring.model.Message;

@Service
public class MessageServiceImpl implements MessageService {
	
	private MessageDAO messageDAO;

	public void setMessageDAO(MessageDAO messageDAO) {
		this.messageDAO = messageDAO;
	}

	@Override
	@Transactional
	public void addMessage(Message p) {
		this.messageDAO.addMessage(p);
	}

	@Override
	@Transactional
	public void updateMessage(Message p) {
		this.messageDAO.updateMessage(p);
	}

	@Override
	@Transactional
	public List<Message> listMessages() {
		return this.messageDAO.listMessages();
	}

	@Override
	@Transactional
	public List<Message> paginationMessages(int startResult, int maxResult) {
		return this.messageDAO.paginationMessages(startResult, maxResult);
	}
	
	@Override
	@Transactional
	public List<Message> inbox(String addressee_id,int status) {
		return this.messageDAO.inbox(addressee_id, status);
	}
	
	@Override
	@Transactional
	public Message getMessageById(String id) {
		return this.messageDAO.getMessageById(id);
	}

	@Override
	@Transactional
	public void removeMessage(String id) {
		this.messageDAO.removeMessage(id);
	}

}
