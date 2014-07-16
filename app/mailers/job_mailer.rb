class JobMailer < ActionMailer::Base

  default from: "\"百萬案件發包網\" #{Setting.email_sender}"

  def deliver_email_for_edit(job)
    @job = job
    mail(:to => job.email, :subject => "[百萬案件發包網] 感謝您在本站刊登案件！")
  end
end
