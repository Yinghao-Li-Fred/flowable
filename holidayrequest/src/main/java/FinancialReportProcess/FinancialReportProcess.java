package FinancialReportProcess;

import java.util.List;

import org.flowable.engine.ProcessEngine;
import org.flowable.engine.ProcessEngineConfiguration;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.repository.Deployment;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.idm.engine.impl.cfg.StandaloneIdmEngineConfiguration;
import org.flowable.task.api.Task;

import ConfigClass.ConfigClass;

public class FinancialReportProcess {

	public static void main(String[] args) {
		
		ProcessEngine processEngine = null;
		processEngine = ConfigClass.setUpJdbc();
		
		RepositoryService repositoryService = processEngine.getRepositoryService();
		
		Deployment deployment = repositoryService.createDeployment()
				.addClasspathResource("FinancialReportProcess.bpmn20.xml")
				.deploy();
		
		RuntimeService runtimeService = processEngine.getRuntimeService();
		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey("financialReport");
		
		TaskService taskService = processEngine.getTaskService();
		List<Task> tasks = taskService.createTaskQuery().taskCandidateGroup("accountancy").list();		
	}
}
