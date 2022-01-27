module ProfilesHelper
    include HomeHelper

    def get_date_in_month_year_format(date)
        if date.nil?
            return ""
        end
        date.strftime("%b %Y")
    end

    def update_array_attributes_in_params(params)
        params[:name] = get_array_from_comma_separated_string_S(params[:name])
        params[:job_title] = get_array_from_comma_separated_string_S(params[:job_title])
        params[:total_experience] = get_array_from_comma_separated_string_S(params[:total_experience])
        
        params[:overview] = get_array_from_comma_separated_string_S(params[:overview])
           
        params[:career_highlights] = get_array_from_comma_separated_string(params[:career_highlights])
        params[:primary_skills] = get_array_from_comma_separated_string(params[:primary_skills])
        params[:secondary_skills] = get_array_from_comma_separated_string(params[:secondary_skills])
        params
    end
    
end
