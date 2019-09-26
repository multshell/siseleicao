module ApplicationHelper
    EXERCICIO = [
        ["2017", "2017"],
        ["2018", "2018"],
        ["2019", "2019"],
        ["2020", "2020"]
    ]
    
    def options_for_exercicio(selected)
        options_for_select(EXERCICIO, selected)
    end
    
    def ano_corrente
        time = Time.zone.now
        return time.year.to_s
    end
end
