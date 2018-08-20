desc "import ESPN's list of top 300 ppr players"
task import_players: :environment do
  ESPN_URL = 'http://www.espn.com/espn/print?id=23801843&type=Story&imagesPrint=off'
  doc = Nokogiri::HTML(open(ESPN_URL))
  players_table_rows = doc.css('table').last.css('tr.last')

  players_table_rows.each do |p|
    td = p.css('td')
    split_name = td.first.text.split(%r{\d\. })

    rank = split_name.first
    name = split_name.last
    position = td[1].text
    team = td[2].text
    position_rank = td[3].text

    Player.find_or_create_by(name: name) do |player|
      puts "Creating #{name}..."
      player.rank = rank.to_i
      player.position = position
      player.team = team
      player.position_rank = position_rank
    end
  end
end
