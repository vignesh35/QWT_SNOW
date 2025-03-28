select orderid,sum(linesalesamount) as sales  from
{{ref('fct_orders')}}
group by 1 having (sales<0)