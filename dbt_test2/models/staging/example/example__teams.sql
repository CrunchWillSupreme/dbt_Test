with teams as (
    select name from {{ ref('team_location')}}
),

final as (
    select * 
    from teams
)

select * from final