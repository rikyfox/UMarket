class MailboxController < ApplicationController
  before_action :logged_in_user
  before_action :vendor_user
  

  def inbox
    @inbox = mailbox.inbox
    @active = :inbox
  end

  def sent
    @sent = mailbox.sentbox
    @active = :sent
  end

  def trash
    @trash = mailbox.trash
    @active = :trash
  end
  

end
