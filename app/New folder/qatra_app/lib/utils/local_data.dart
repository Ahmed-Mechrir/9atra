class AppLocalData {
  // List of associations and centers -------------------------------------------------------
  static final List elementsCenter = [
    {
      'image': 'assets/images/centers/center-01.jpg',
      'title':
          'Centre de sang rural de la ville Centre de sang rural de la ville',
      'subtitle': 'Association',
      'city': 'Rabat',
      'rating': 4.5,
    },
    {
      'image': 'assets/images/centers/center-02.jpg',
      'title': 'Centre de santé ville de Tanger',
      'subtitle': 'Association',
      'city': 'Fès',
      'rating': 1,
    },
    {
      'image': 'assets/images/centers/center-03.jpg',
      'title': 'Centre de santé n°3 jusqu\'à la mort',
      'subtitle': 'Centre de santé',
      'city': 'Casablanca',
      'rating': 2.5,
    },
    {
      'image': 'assets/images/centers/center-04.jpg',
      'title': 'Centre de santé en Rabat',
      'subtitle': 'Association',
      'city': 'Rabat',
      'rating': 4,
    },
    {
      'image': 'assets/images/centers/center-05.jpg',
      'title': 'Centre de santé wesh',
      'subtitle': 'Centre de santé',
      'city': 'Rabat',
      'rating': 3.5,
    },
    {
      'image': 'assets/images/centers/center-06.jpg',
      'title': 'Centre de santé zéro deux',
      'subtitle': 'Association',
      'city': 'Rabat',
      'rating': 5,
    },
  ];

  // List of associations -------------------------------------------------------
  static final List elementsAssociation = [
    {
      'image': 'assets/images/centers/center-01.jpg',
      'title':
          'Association de sang rural de la ville Centre de sang rural de la ville',
      'date_debut': '15/05/2020',
      'date_fin': '15/06/2020',
      'city': 'Rabat',
      'like': false,
    },
    {
      'image': 'assets/images/centers/center-02.jpg',
      'title': 'Association de santé ville de Fès',
      'date_debut': '10/01/2020',
      'date_fin': '20/02/2020',
      'city': 'Fès',
      'rating': true,
    },
    {
      'image': 'assets/images/centers/center-05.jpg',
      'title': 'Association de sang rural de la ville',
      'date_debut': '15/05/2020',
      'date_fin': '15/06/2020',
      'city': 'Rabat',
      'rating': false,
    },
    {
      'image': 'assets/images/centers/center-06.jpg',
      'title': 'Association des malades',
      'date_debut': '02/07/2022',
      'date_fin': '15/07/2022',
      'city': 'Rabat',
      'rating': false,
    },
    {
      'image': 'assets/images/centers/center-01.jpg',
      'title':
          'Association de sang rural de la ville Centre de sang rural de la ville',
      'date_debut': '15/05/2020',
      'date_fin': '15/06/2020',
      'city': 'Rabat',
      'like': false,
    },
    {
      'image': 'assets/images/centers/center-02.jpg',
      'title': 'Association de santé ville de Fès',
      'date_debut': '10/01/2020',
      'date_fin': '20/02/2020',
      'city': 'Fès',
      'rating': true,
    },
    {
      'image': 'assets/images/centers/center-05.jpg',
      'title': 'Association de sang rural de la ville',
      'date_debut': '15/05/2020',
      'date_fin': '15/06/2020',
      'city': 'Rabat',
      'rating': false,
    },
    {
      'image': 'assets/images/centers/center-06.jpg',
      'title': 'Association des malades',
      'date_debut': '02/07/2022',
      'date_fin': '15/07/2022',
      'city': 'Rabat',
      'rating': false,
    },
  ];

  // Images for details center or association -------------------------------------------------------
  static final List<String> imgsCenterAssociation = [
    'assets/images/centers/center-01.jpg',
    'assets/images/centers/center-02.jpg',
    'assets/images/centers/center-03.jpg',
    'assets/images/centers/center-04.jpg',
    'assets/images/centers/center-05.jpg',
    'assets/images/centers/center-06.jpg',
  ];

  // Locations of associations and centers -------------------------------------------------------
  static final List elementsLocations = [
    {
      'lat_pos': '33.5857998283764',
      'lng_pos': '-7.6222746284179',
      'type': 'Association',
    },
    {
      'lat_pos': '33.59219343198072',
      'lng_pos': '-7.598441860216072',
      'type': 'Centre de santé',
    },
    {
      'lat_pos': '33.56955617967239',
      'lng_pos': '-7.660010627048443',
      'type': 'Association',
    },
    {
      'lat_pos': '33.5904159325849',
      'lng_pos': '-7.524785998559609',
      'type': 'Centre de santé',
    },
    {
      'lat_pos': '33.69765695892116',
      'lng_pos': '-7.38938475113258',
      'type': 'Association',
    },
    {
      'lat_pos': '33.68568951542074',
      'lng_pos': '-7.38632300954208',
      'type': 'Centre de santé',
    },
    {
      'lat_pos': '34.031580267119914',
      'lng_pos': '-5.002563510243403',
      'type': 'Association',
    },
    {
      'lat_pos': '34.01727073608204',
      'lng_pos': '-5.035407159630763',
      'type': 'Centre de santé',
    },
    {
      'lat_pos': '34.05401722582364',
      'lng_pos': '-4.95655211664098',
      'type': 'Association',
    },
  ];

  // List of blood needers -------------------------------------------------------
  static final List elementsNeeder = [
    {
      'type': 'B+',
      'full_name': 'Arun kumar',
      'age': 24,
      'gender': 'Homme',
      'published_date': '15/10',
      'published_time': '15:30',
      'state': 'urgent',
      'litre_sang': '0.5',
    },
    {
      'type': 'A+',
      'full_name': 'Bimla devi',
      'age': 78,
      'gender': 'Femme',
      'published_date': '29/06',
      'published_time': '12:27',
      'state': 'trés urgent',
      'litre_sang': '2.5',
    },
    {
      'type': 'AB-',
      'full_name': 'Rana aman singh',
      'age': 3,
      'gender': 'Homme',
      'published_date': '01/02',
      'published_time': '01:00',
      'state': 'trés urgent',
      'litre_sang': '1.5',
    },
    {
      'type': 'B-',
      'full_name': 'Hamid',
      'age': 12,
      'gender': 'Homme',
      'published': '30/06 - 13:11',
      'published_date': '30/06',
      'published_time': '13:11',
      'state': 'urgent',
      'litre_sang': '2',
    },
    {
      'type': 'O+',
      'full_name': 'Karima saidi',
      'age': 66,
      'gender': 'Femme',
      'published_date': '11/09',
      'published_time': '15:30',
      'state': 'urgent',
      'litre_sang': '1',
    },
    {
      'type': 'AB-',
      'full_name': 'Amir chkiwli',
      'age': 54,
      'gender': 'Homme',
      'published_date': '19/03',
      'published_time': '19:17',
      'state': 'urgent',
      'litre_sang': '5.2',
    },
    {
      'type': 'AB+',
      'full_name': 'Halima',
      'age': 17,
      'gender': 'Femme',
      'published_date': '29/06',
      'published_time': '02:59',
      'state': 'urgent',
      'litre_sang': '4.5',
    },
    {
      'type': 'B+',
      'full_name': 'Mark awita',
      'age': 33,
      'gender': 'Homme',
      'published_date': '25/08',
      'published_time': '15:30',
      'state': 'urgent',
      'litre_sang': '7',
    },
  ];

  // List of my donations -------------------------------------------------------
  static final List elementsMyReservations = [
    {
      'center': 'Centre de santé n°3 jusqu\'à la mort',
      'city': 'Casablanca',
      'day': '29',
      'month': '09',
      'year': '2022',
      'litre_sang': '0.5',
      'status': 'Pas encore confirmé',
    },
    {
      'center': 'Centre de sang rural de la ville de sang rural',
      'city': 'Rabat',
      'day': '15',
      'month': '10',
      'year': '2019',
      'litre_sang': '2',
      'status': 'Confirmé',
    },
    {
      'center': 'Centre de santé ville de Tanger',
      'city': 'Fès',
      'day': '02',
      'month': '06',
      'year': '2016',
      'litre_sang': '1',
      'status': 'Évalué',
    },
  ];

  // List of my demands -------------------------------------------------------
  static final List elementsMyDemands = [
    {
      'center': 'Centre de santé n°3 jusqu\'à la mort',
      'type': 'A+',
      'day': '29',
      'month': '09',
      'year': '2022',
      'litre_sang': '0.5',
    },
    {
      'center': 'Centre de sang rural de la ville de sang rural',
      'type': 'B-',
      'day': '15',
      'month': '10',
      'year': '2019',
      'litre_sang': '2',
    },
    {
      'center': 'Centre de santé ville de Tanger',
      'type': 'AB+',
      'day': '02',
      'month': '06',
      'year': '2016',
      'litre_sang': '1',
    },
  ];

  // List of Advices -------------------------------------------------------
  static final List elementsAdvice = [
    {
      'index': 0,
      'title': 'Avant votre don',
      'description': 'Conseils supplémentaires avant de faire un don :',
      'list_desc': [
        'Donner des plaquettes ? Ne prenez pas d\'aspirine pendant 2 jours avant votre rendez-vous.',
        'Demandez à un ami de faire un don en même temps. Vous pouvez vous soutenir et vous faire deux fois plus de bien !',
        'l\'application Qatra va vous rappeler de votre rendez-vous résérvé.',
      ]
    },
    {
      'index': 1,
      'title': 'Le jour de votre don',
      'description': 'Conseils supplémentaires pour le jour de votre don :',
      'list_desc': [
        'Buvez 16 oz supplémentaires. d\'eau (ou autre boisson non alcoolisée) avant votre rendez-vous. Mangez un repas sain, en évitant les aliments gras comme les hamburgers, les frites ou la crème glacée.',
        'Portez une chemise avec des manches que vous pouvez retrousser au-dessus de vos coudes.',
        'Faites-nous savoir si vous avez un bras préféré ou une veine particulière qui a été utilisée avec succès dans le passé pour prélever du sang.',
        'Détendez-vous, écoutez de la musique, parlez à d\'autres donateurs ou lisez pendant que vous faites un don.',
      ]
    },
    {
      'index': 2,
      'title': 'Après votre don',
      'description': 'Conseils supplémentaires après votre don :',
      'list_desc': [
        'Ne faites pas de levage lourd ou d\'exercice vigoureux pour le reste de la journée.',
        'Si le site de l\'aiguille commence à saigner, appliquez une pression et levez le bras droit pendant 5 à 10 minutes ou jusqu\'à ce que le saignement s\'arrête.',
        'Appelez votre centre pour signaler toute information médicale supplémentaire que vous avez oublié de nous dire, si vous avez des problèmes ou si vous avez eu besoin de soins médicaux après avoir donné du sang.',
        'Si vous donnez fréquemment, assurez-vous de prendre des multivitamines avec du fer pour vous assurer de continuer à reconstituer vos réserves de fer avant votre prochain don.',
      ]
    },
    {
      'index': 3,
      'title': 'Lorsque vous donnez du sang, mangez des aliments riches en fer',
      'description':
          'Si vous êtes à la limite de l\'anémie ou si vous suivez un régime pauvre en fer, cette étape est extrêmement importante. Selon une étude de 2019, 11,2% des donneurs de sang volontaires sont carencés en fer. Les dons de sang pauvres en fer ne peuvent pas être utilisés. Souvent, les donateurs ne sont pas conscients de cela jusqu\'à ce qu\'ils s\'assoient au moment du don et qu\'on leur dise d\'introduire plus de viandes rouges et de légumes-feuilles dans leur alimentation. Pour éviter de perdre du temps et du sang, assurez-vous de manger des aliments riches en vitamine C au moins un mois avant votre don.',
      'list_desc': []
    },
    {
      'index': 4,
      'title': 'Restez hydraté',
      'description':
          'Une grande partie de notre sang est constituée d\'eau. Lorsque vous faites un don, certaines de vos réserves d\'eau sont également données. En prévision de cela, vous voudrez vous hydrater avant et après avoir fait votre don. Il est recommandé de boire deux verres d\'eau supplémentaires avant de partir donner du sang.',
      'list_desc': []
    },
    {
      'index': 5,
      'title': 'Présentez-vous',
      'description':
          'Avant de pouvoir donner du sang, vous passerez par un processus de sélection. On vous demandera de confirmer votre âge, votre poids, votre identité et votre état de santé. Il est important que vous soyez aussi transparent que possible pendant cette période. Il existe de nombreuses complications de santé, médicaments et articles divers qui peuvent avoir un impact sur votre capacité à faire un don - même des piercings frais, de nouveaux tatouages et des voyages récents peuvent amener une banque de sang à prendre votre rendez-vous trois mois plus tard que prévu.',
      'list_desc': []
    },
    {
      'index': 6,
      'title': 'Portez des vêtements confortables',
      'description':
          'Rien n\'est plus inconfortable que de se présenter à une fête trop ou pas assez habillé. Si nous devions choisir une seconde proche, ce serait de se présenter pour donner du sang vêtu d\'une chemise à manches longues. Se présenter dans la mauvaise tenue peut rendre difficile pour le phlébotomiste de prendre votre collection. Dans de nombreux cas, le don de sang n\'est pas impromptu. Vous devrez planifier votre rendez-vous à l\'avance, alors assurez-vous de vous laisser une note pour porter quelque chose à manches courtes à votre rendez-vous de don.',
      'list_desc': []
    },
    {
      'index': 7,
      'title': 'Détendez-vous et ressourcez-vous',
      'description':
          'Les avantages du don de sang comprennent un risque réduit de crise cardiaque, un foie en meilleure santé et une raison de se détendre et de se détendre, entre autres. Immédiatement après avoir donné du sang, vous pouvez vous sentir étourdi et fatigué. À ce stade, vous devriez vous asseoir ou vous allonger et grignoter quelque chose de riche en sucre. De nombreux sites de don de sang encouragent cela en fournissant aux donneurs du jus, des biscuits et un endroit pour se reposer. Après avoir quitté le site de don, vous devez éviter les exercices physiques intenses, idéalement pour le reste de la journée.',
      'list_desc': []
    },
  ];

  // List of FAQS -------------------------------------------------------
  static final List elementsFAQ = [
    {
      'index': 0,
      'question':
          'Qu\'est-ce que le sang ? Combien de sang un corps humain contient-il contenir?',
      'response':
          'Le sang est le liquide de couleur rouge qui coule continuellement dans le système circulatoire du corps humain. En moyenne, un l\'être humain a environ 5 à 6 litres de sang qui coule le corps. Environ 7% du poids corporel d\'une personne en bonne santé l\'individu est représenté par le sang.'
    },
    {
      'index': 1,
      'question': 'Quelle est la composition du sang ?',
      'response':
          'Le sang contient principalement un liquide appelé plasma qui a trois types de cellules - les globules rouges ou les globules rouges, globules blancs ou globules blancs et plaquettes. Plasma agit comme un véhicule pour transporter la nutrition, y compris les protéines, glucose, enzymes et hormones, etc. Sang rouge les cellules transportent l \'oxygène des poumons vers divers corps tissus. Les globules blancs aident le système immunitaire du corps et les plaquettes facilitent le processus de coagulation et coagulation du sang.'
    },
    {
      'index': 2,
      'question': 'Comment se forme le sang ?',
      'response':
          'Les globules rouges, les granulocytes des globules blancs et les plaquettes sont produit principalement par la moelle osseuse. Les lymphocytes et les monocytes se forment dans les lymphoïdes et tissus réticulo-endothéliaux. La prolifération ordonnée des cellules de la moelle osseuse et leur libération dans le système circulatoire est soigneusement régulé selon les besoins du corps. Chaque jour, nouveau les cellules sanguines sont produites dans la moelle osseuse et chaque jour, de vieilles cellules meurent et sont retirées de la corps.'
    },
    {
      'index': 3,
      'question': 'Quelle est la vie naturelle des cellules sanguines ?',
      'response':
          'Les globules rouges ont une durée de vie d\'environ 120 jours, les blancs les cellules sanguines vivent quelques jours et les plaquettes quelques jours les heures. L\'ajout de nouvelles cellules et la suppression des anciennes cellules est un processus continu.'
    },
    {
      'index': 4,
      'question': 'Qu\'est-ce que l\'hémoglobine ?',
      'response':
          'L\'hémoglobine est une substance présente dans le rouge cellules sanguines. Il aide à transporter l\'oxygène et le dioxyde de carbone vers différentes parties du corps. En moyenne, le taux d\'hémoglobine d\'un homme en bonne santé doit être entre 14 et 16 g/dL et pour une femme entre 12 et 14 g/dL.'
    },
    {
      'index': 5,
      'question': 'Que sont les groupes sanguins ?',
      'response':
          'Chaque individu appartient à deux grands groupes sanguins groupes. Le premier s\'appelle le groupe ABO et le deuxième type est appelé le groupe Rh. Dans le groupe ABO il existe quatre catégories à savoir : A, B, O et AB. Dans le groupe Rh, soit l\'individu est Rh positif, soit Rh négatif. Rh désigne le facteur Rhésus, nommé pour les singes rhésus. Ainsi, chaque être humain appartient à l\'un des groupes suivants :\nA positif ou A négatif \nB positif ou B négatif \nO positif ou O négatif \nAB positif ou AB négatif \nL\'aspect positif ou négatif est basé sur le Rh facteur.'
    },
    {
      'index': 6,
      'question':
          'Quelle est l\'importance de connaître les groupes sanguins ?',
      'response':
          'À toutes fins pratiques et routinières, il est idéal de transfuser au patient le même groupe de sang auquel il/elle appartient. En aucun cas une personne du groupe O peut-elle avoir un autre sang que O. De même, un patient du groupe A ne peut pas recevoir de groupe B sang et vice versa. Ce n\'est qu\'en cas d\'extrême urgence que nous prenons le groupe O comme donneur universel et AB groupes comme destinataire universel.'
    },
    {
      'index': 7,
      'question':
          'Pourquoi une personne du groupe A ne reçoit-elle pas de sang du groupe B ?',
      'response':
          'Le sang d\'une personne du groupe A contient des anti-groupe B anticorps. Chez les personnes du groupe sanguin B, il y a anticorps anti-groupe A. Si nous donnons du sang du groupe A à un patient du groupe B, il est forcément incompatible et entraînera de graves conséquences.'
    },
    {
      'index': 8,
      'question': 'Combien de temps le sang peut-il être conservé ?',
      'response':
          'Le sang total peut être conservé jusqu\'à 35 jours, lorsque conservé dans une solution anticoagulante CPDA et réfrigéré à 2–4 °C.'
    },
  ];
}
