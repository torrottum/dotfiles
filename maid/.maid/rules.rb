# Requires Maid version >= 8.0 (gem install maid --pre)

Maid.rules do

  rule 'Clean up Desktop' do
    dir('~/Desktop/*').each do |path|
      basename = File.basename(path)
      next if basename === "Limbo"
      next if basename === "Screenshots"

      if 2.days.since?(added_at(path))
        move(path, '~/Desktop/Limbo')
        system("/usr/local/bin/terminal-notifier -message \"Moved #{basename} to Limbo\"")
      end
    end

    dir('~/Desktop/Screen Shot *').each do |path|
      move(path, '~/Desktop/Screenshots')
    end
  end

  rule 'Delete old files from Limbo' do
    dir('~/Desktop/Limbo/*').each do |path|
      system("/usr/local/bin/trash '#{path}'") if 4.weeks.since?(added_at(path))
    end
  end

  rule 'Delete old screenshots' do
    dir('~/Desktop/Screenshots/*').each do |path|
      system("/usr/local/bin/trash '#{path}'") if 4.weeks.since?(added_at(path))
    end
  end

  rule 'Clean up downloads folder' do
    dir('~/Downloads/*.torrent').each do |path|
      system("/usr/local/bin/trash '#{path}'")
    end

    # These can generally be downloaded again very easily if needed
    dir('~/Downloads/*.{apk,deb,dmg,exe,pkg,rpm,app}').each do |path|
      system("/usr/local/bin/trash '#{path}'") if 3.days.since?(accessed_at(path))
    end

    dir('~/Downloads/*').each do |path|
      basename = File.basename(path)
      next if basename === "Torrents"
      system("/usr/local/bin/trash '#{path}'") if 4.weeks.since?(added_at(path))
    end
  end

end
