require 'rails_helper'

feature 'Comment', js: true do
  let(:user) { build(:user) }

  scenario 'Create Comment', js: true do
    visit root_path
    click_on 'Get Started'
    click_on 'Sign up now'
    sign_up(user)
    expect(page).to have_selector '.alert-notice', text: 'アカウント登録を受け付けました。'

    click_on 'New Proto'
    prototype = build(:prototype, user_id: user.id)
    post_prototype(prototype)
    expect(page).to have_selector '.alert-notice', text: 'プロトタイプを投稿しました。'

    page.first('.proto-content .thumbnail a').click

    comment = Faker::StarWars.quote
    fill_in 'comment[content]', with: comment
    click_on 'Comment'
    sleep 2
    expect(page.first('#post-comment .media .media-body p').text).to eq comment
  end
end
