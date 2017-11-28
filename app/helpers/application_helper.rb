module ApplicationHelper
  def nav_status(nav_item)
    nav_item == @current_nav_item ? 'active' : 'inactive'
  end

  def nav_item_url(nav_item)
    nav_item == @current_nav_item ? '#' : self.nav_item_urls[nav_item]
  end

  def nav_item_urls
    {
      home: root_url,
      play_trivia: topics_url,
      leaderboard: leaderboards_path
    }
  end
end
