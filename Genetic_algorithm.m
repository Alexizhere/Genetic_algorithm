clear all;
warning('off','all') 
tic
GA_TARGET = 'Hello World'; 
GA_POP_SIZE=10000;    
GA_MAX_ITER=500;   
GA_ELITE_RATE=0.10;   
GA_MUTATION_RATE=0.2;   
   
Generation=0;

Population=randi([32 122], GA_POP_SIZE, length(GA_TARGET));



while Generation<GA_MAX_ITER
    
    Difference=abs(Population-GA_TARGET); 
    Fitness=sum(Difference'); Generation=Generation+1;
    
    [Fitness, index]=sort(Fitness);
    Population=Population(index,:);
   
    disp(sprintf('%d. generáció legjobb jósága: %d, %s', Generation, Fitness(1), char(Population(1,:))));
    if Fitness(1)==0
        break; 
    end;
    
    
    EliteSelection=Population(1:floor(GA_ELITE_RATE * GA_POP_SIZE),:);

    
    for i=1:GA_POP_SIZE
        Parent1=randi([1 floor(GA_ELITE_RATE * GA_POP_SIZE)]); 
        Parent2=randi([1 floor(GA_ELITE_RATE * GA_POP_SIZE)]);  
        CrossoverPoint=randi([0 1],1,length(GA_TARGET)); 
        Population(i,:)=EliteSelection(Parent1,:).*CrossoverPoint+EliteSelection(Parent2,:).*(1-CrossoverPoint);            
    end

    
    for i=1:length(Population(:))*GA_MUTATION_RATE                      
       Population(randi(randi([1 GA_POP_SIZE]), [1 length(GA_TARGET)]))= randi(255);       
    end


end 
toc