# завантажити пакет для роботи з запитами до сайтів (скрейперами)
library(rvest)

result <- data.frame()  # створюємо пустий датафрейм (табличку)
loaded = 0              # у цій змінній будуть зберігатися номер сторінки з коментарями
are_there_comments = TRUE # чи залишились ще коментарі?

#
# Логіка цієї програми наступна: сайт fs.life повертає для кожного серіалу лише 10 коментів за раз,
# тому ми створимо цикл "while"  який буде запитувати кожного разу наступні 10 коментарів, поки вони
# не закінчаться. Наступні коментарі ми отримаємо, якщо в кожному кроці циклу while змінювати 
# останнє число в адресі запиту, наприклад адреса запиту у такій формі:
# "http://fs.life/review/list/iJiv5DaSBTFQlgYieKtB73?itemisfull=1&loadedcount=19 - означає що ми вже 
# промотали 19 коментарів, і нам потрібні наступні 10
# Для кожнії такої сторінки з 10 коментарями ми будемо збирати з неї текст коментарів,
# час і дату, коли їх було зроблено, та їх настрій - позитивний або негативний. все це ми знайдем 
# завдяки аналізу структури сторінки, в яких тегах все це знаходиться, які CSS-селектори використати -
# використовуючи "development tools" у браузері
# Всі зібрані коменти будемо зберігати у табличці result 
# 

while( are_there_comments ){  # поки ще залишаються коментарі, виконувати все що фігурних дужках
  
  # шаблон адреси сторінки з коментарями для конкретного серіалу,
  # функція paste() додає в кінці строки до базової адреси значення, що містить змінна loaded 
  url <- paste("http://fs.life/review/list/iJiv5DaSBTFQlgYieKtB73?itemisfull=1&loadedcount=", loaded, sep = '')
  comments <- read_html(url)  # завантажуємо сторінку
  
  # виокремлюємо текст кожного коментаря
  alltexts <- comments %>%
    # селектор 'div.b-item-material-comments__item-text' бере теги "<div>", що мають 
    # ім"я класу "b-item-material-comments__item-text"
    html_nodes('div.b-item-material-comments__item-text') %>%  
    html_text() # функція html_text() залишає лише текст, що всередині тегів 
  
  # виокремлюємо час і дату
  times <- comments %>% 
    html_nodes('time') %>% # беремо лише теги <time>
    html_attr('datetime')  # і обираємо лише значення атрибуту 'datetime'
  
  # визначимо чи позитивним є комент, із назви класу
  clasname <- comments %>%
    html_nodes('div.b-item-material-comments__item') %>% # весь комент у цьому div
    html_attr('class') %>%  # назва класу
    substr( nchar(.)-7, nchar(.) ) # останні 8 букв назви, або "positive", або "negative"
  
  # створюємо data.frame (табличку) з трьома колонками: text, time, sentiment 
  df <- data.frame(text = alltexts, time = times, sentiment = clasname)
  
  # додаємо коментарі з поточної сторінки (df) до всіх уже зібраних, що є в result
  result <- rbind(result, df)
  loaded = loaded + 10 # збільшуємо змінну з кількістю зібраних коментарів на 10 (кількість на сторінці,
                       # ми їх тільки що додали)

  if( length(alltexts) == 0 ){ #  якщо довжина (length) вектору з тегами дорівнює (==) 0, це значить
    are_there_comments = FALSE #  ми зібрали всі коментарі, і нам треба закінчувати цикл
  }
  
}

#
# УВАГА!!! кінець кода для скрейпера. далі поки що можете не читати
#


# TODO: tutorial for dplyr based on 
# http://paldhous.github.io/NICAR/2017/r-analysis.html

library(ggplot2)
chart_data <- result %>%
  mutate(month = substr(time, 0, 7)) %>%
  group_by(month, sentiment) %>%
  summarise(total = n())

# negative vs positive, month dynamics
ggplot(chart_data, aes(x=month, y=total, color = sentiment )) + geom_point() +
   theme_bw() + theme(legend.position="none") 

# TODO: dot histogramm, show each comment as a dot for each month, up - positive, down - negative
# TODO: what's the month with most negative/positive reviews?

# aggregate by day's hour
chart_data <- result %>%
  mutate(hour = as.integer( substr( result$time, 
                        nchar(as.character(result$time) ) - 13, 
                        nchar(as.character(result$time)) - 12 ))  )
# all reviews by hour  
ggplot(chart_data, aes(x=time, y=hour, color = sentiment )) + geom_point() +
  theme_bw() + theme(legend.position="none")   

# TODO: what's the hour with most negative/positive reviews?
# TODO: dot histogramm, show each comment as a dot for each hour
# TODO: the same charts as above, but for days
