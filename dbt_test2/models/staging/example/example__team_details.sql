with teams as (
    select * from {{ ref('example__teams')}}
),

team_locations as (
    select * from {{ ref('team_location') }}
),

final as (
    select
        teams.name as team,
        team_locations.city as city,
        team_locations.state as state,
        iff(teams.name = '{{ var("current_champion") }}',true, false) as is_champion
    
    from teams

    left join team_locations
    on team_locations.name = teams.name
)

select * from final