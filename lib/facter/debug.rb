Facter.add("puppet_debug") do
    puppet_debug = false
    varlib = Facter.value('puppet_varlib')
    if File.exists?("#{varlib}/puppet_debug")
        puppet_debug = true
    end

    setcode do
        puppet_debug
    end
end
