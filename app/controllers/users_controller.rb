class UsersController < ApplicationController
  def top_commenters
    @users = User.joins(:comments)
                .where('comments.created_at >= ?', 1.week.ago)
                .select('count(*) as count_all, users.*')
                .group('users.id')
                .order('count_all DESC')
                .limit(10)
  end
end
