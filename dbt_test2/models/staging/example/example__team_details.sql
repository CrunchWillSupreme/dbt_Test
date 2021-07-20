with teams as (
    select * from {{ ref('team_location')}}
),

final as (
    select * from teams
)

select * from final