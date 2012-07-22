class UsersController < ApplicationController
  def new
		@user = User.new # dla strony ktora tworzy uzytkownika wywola sie ta metoda tworzaca zmienną z nowym użytkownikiem
  end

	def show
		@user = User.find(params[:id]) # id to jest parametr liczba wysylany razem z GET http wchodzacy w czesc URL (users/id)
	end 				# to nam robi tyle ze na podstawie urla wyszukujemy po id usera w bazie i zrzucamy do zmiennej, ktora wykorzystujemy w widoku do wypisania informacji


	def create
		@user = User.new(params[:user]) # przekazujemy parametry zebrane z formularza. tamten obiekt tymczasowy od teraz jest nieprzydatny.
		if @user.save				# params od obiektu zawiera hasha hashy gdzie obiekt jest mapowany na parametry a kazdy z parametrow to tez hash np Password: dupa itd.


			flash[:success] = "Registered succesfully" # dodajemy pare key value do hasha, tego hasha potem wyswietlimy uzytkownikowi
			redirect_to @user # przekierowuje do users/id usera @user. 


			# Jeśli się udało zasejfować to nie musimy generować strony z wyjaśnieniem dlaczego sie nie udało(tu kiedyś będzie komunikat o sukcesie zapewne
		else
			render 'new' #wyrenderuj widok users/new
		end
	end

end
