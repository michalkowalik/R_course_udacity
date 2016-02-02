## relationship between age and friendships initiated

ggplot(aes(x = age, y = friendships_initiated), data = pf)  +
  geom_point(alpha = 1/20, position = position_jitter(h = 0)) +
  xlim(13, 90) + 
  coord_trans(y = "sqrt")
