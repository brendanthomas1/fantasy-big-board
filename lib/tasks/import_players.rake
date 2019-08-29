desc "import ESPN's list of top 300 ppr players"
task import_players: :environment do
  ESPN_URL = 'http://www.espn.com/espn/print?id=25759239'
  doc = Nokogiri::HTML(open(ESPN_URL))
  players_table_rows = doc.css('table')[3].css('tr.last')

  players_table_rows.each do |p|
    td = p.css('td')
    split_name = td.first.text.split('. ', 2)

    rank = split_name.first
    name = split_name.last
    team = td[1].text
    position = td[2].text

    Player.find_or_create_by(name: name) do |player|
      puts "Creating #{name}..."
      player.rank = rank.to_i
      player.position = position
      player.team = team
    end
  end
end
