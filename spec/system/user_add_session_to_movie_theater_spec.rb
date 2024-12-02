require 'rails_helper'

describe 'Add session to movie theater' do
  it 'success' do
    movie_theater = FactoryBot.create(:movie_theater, name: 'Cine Paradiso')
    user = FactoryBot.create(:user, email: 'joao@email.com', password: '123456789')
    Movie.create!(title: 'Jurassic Park', year: 1993, director: 'Steven Spielberg', 
              plot:  'Os paleontólogos Alan Grant, Ellie Sattler e o matemático Ian Malcolm fazem parte de um seleto grupo escolhido para visitar uma ilha habitada por dinossauros criados a partir de DNA pré-histórico. O idealizador do projeto e bilionário John Hammond garante a todos que a instalação é completamente segura. Mas após uma queda de energia, os visitantes descobrem, aos poucos, que vários predadores ferozes estão soltos e à caça.')
    login_as user

    visit root_path
    within('nav') do
      click_on 'Cinemas'
    end
    click_on 'Cine Paradiso'
    click_on 'Adicionar Session'
    fill_in 'Dia', with: 'segunda-feira'
    fill_in 'Hora', with: '19:00'
    select 'Jurassic Park', from: 'Filme'
    select 'Sala 01', from: 'Sala'
    click_on 'Criar Session'

    expect(page).to have_css 'h1', text: 'Cine Paradiso: Sessões'
    expect(page).to have_content 'Jurassic Park'
    expect(page).to have_content 'Sala 01'
    expect(page).to have_content 'segunda-feira'
    expect(page).to have_content '19:00'
  end
end