namespace :dev do

  def show_sppiner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}...")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

  desc 'Apaga, cria, migra e popula banco de dados'
  task drop_end_set_db: :environment do
    if Rails.env.development?
      show_sppiner("Apagando BD...") do
        %x{rails db:drop}
      end

      show_sppiner("Criando BD...") do
        %x{rails db:create}
      end

      show_sppiner("Migrando BD...") do
        %x{rails db:migrate}
      end

      %x{rails dev:popula_db}

    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  desc 'Popula banco de dados'
  task popula_db: :environment do
    if Rails.env.development?
      # Popula ---------
      show_sppiner("Adicionando QuestionTypes...") do
        %x{rails dev:add_question_types}
      end

      show_sppiner("Adicionando Questions...") do
        %x{rails dev:add_questions}
      end

      show_sppiner("Adicionando DateOfBirths...") do
        %x{rails dev:add_date_of_births}
      end

      show_sppiner("Adicionando Nomes e Sobrenomes...") do
        %x{rails dev:add_names}
      end

      show_sppiner("Adicionando Municipios...") do
        %x{rails dev:add_counties}
      end

      show_sppiner("Adicionando Bairros...") do
        %x{rails dev:add_districts}
      end
    end
  end

  desc 'Cadastro de QuestionTypes'
  task add_question_types: :environment do
    question_types = [
        {
            desc: 'Name'
        },
        {
            desc: 'District'
        },
        {
            desc: 'County'
        },
        {
            desc: 'Date'
        }
    ]
    question_types.each do |question_type|
      QuestionType.find_or_create_by!(question_type)
    end
  end

  desc 'Cadastro de Questions'
  task add_questions: :environment do
    questions = [
        {
            desc: 'Qual o seu primeiro nome?',
            question_type: QuestionType.where(desc: 'Name').take!
        },
        {
            desc: 'Em que bairro voce vive?',
            question_type: QuestionType.where(desc: 'District').take!
        },
        {
            desc: 'Em qual mês você nasceu?',
            question_type: QuestionType.where(desc: 'Date').take!
        }
    ]
    questions.each do |question|
      Question.find_or_create_by!(question)
    end
  end

  desc 'Cadastro de DateOfBirths'
  task add_date_of_births: :environment do
    date_of_births = [
        {
            day: '6',
            month: '4',
            year: '1998'
        },
        {
            day: '7',
            month: '5',
            year: '1999'
        },
        {
            day: '8',
            month: '6',
            year: '2000'
        }
    ]
    date_of_births.each do |date_of_birth|
      DateOfBirth.find_or_create_by!(date_of_birth)
    end
  end

  desc 'Cadastro de Districts'
  task add_districts: :environment do
    districts = [
        {
            desc: 'Morada do Sol'
        },
        {
            desc: 'Sonia Regina'
        },
        {
            desc: 'Santa Barbara'
        },
        {
            desc: 'Maria Rosa'
        }
    ]
    districts.each do |district|
      District.find_or_create_by!(district)
    end
  end

  desc 'Cadastro de Nomes e Sobrenomes'
  task add_names: :environment do
    names = [
        {
            name: 'Kleber',
            last_name: 'Cabral',
            sexo: true
        },
        {
            name: 'Paula',
            last_name: 'Ana',
            sexo: false
        },
        {
            name: 'João',
            last_name: 'Pereira',
            sexo: true
        },
        {
            name: 'Kavila',
            last_name: 'Souza',
            sexo: false
        }
    ]
    names.each do |name|
      Name.find_or_create_by!(name)
    end
  end


  desc 'Cadastro de Municípios'
  task add_counties: :environment do
    counties = [
        {
            desc: 'Palmas'
        },
        {
            desc: 'Porto Nacional'
        },
        {
            desc: 'Guaraí'
        },
        {
            desc: 'Gurupi'
        }
    ]
    counties.each do |county|
      County.find_or_create_by!(county)
    end
  end
end
