class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :should_be_admin

  def index
    @users = User.all
  end

  def purchases
    @purchases = Purchase.all
  end

  def users_negative_10
    @users = User.all.select{ |u| u.line_items.select{ |l| l.amount < 0 && l.created_at > Time.current - 1.year }.count > 10 }
  end

  def users_negative_30
    @users = User.all.select{ |u| u.line_items.select{ |l| l.amount < 0 }.count / u.line_items.count > 0.3 }
  end

  def users_negative_10_30
    neg_10 = User.all.select{ |u| u.line_items.select{ |l| l.amount < 0 && l.created_at > Time.current - 1.year }.count > 10 }
    neg_30 = User.all.select{ |u| u.line_items.select{ |l| l.amount < 0 }.count / u.line_items.count > 0.3 }
    @users = (neg_10 + neg_30).uniq
  end

  private

  def should_be_admin
    return unless current_user.email == 'admin@example.com'
  end
end
