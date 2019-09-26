# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Cadastrando o USUARIO Administrador Padrão.."

    User.create!(name: "Super Usuário",
                email: "admin@admin.com",
                password: "#pass@pmm-sis18*",
                password_confirmation: "#pass@pmm-sis18*",
                role: 0)
             
puts "USUARIO Cadastrado com Sucesso!"

puts "Cadastrado a Eleição"

    Eleicao.create!(descricao: "Conselho Tutelar 2019",
                   numerournas: 56,
                   numeroeleitores: 161053,
                   numerocandidatos: 59)
                 
puts "Eleição Cadastrada com Sucesso"

puts "Cadastrado as Urnas"

    Urna.create!(escola: "Escola Judith Gomes Leitão", localidade: "Marabá Pioneira", numero: "01", secoes: "42, 43, 44, 45, 46, 47, 62, 480, 511, 590, 606, 623", eleitores: 2678, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Escola Judith Gomes Leitão", localidade: "Marabá Pioneira", numero: "02", secoes: "48, 49, 65, 66, 423, 495, 547, 564, 572", eleitores: 1106, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Escola Judith Gomes Leitão", localidade: "Marabá Pioneira", numero: "03", secoes: "50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 513", eleitores: 3198, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Escola Judith Gomes Leitão", localidade: "Marabá Pioneira", numero: "04", secoes: "67, 68, 418, 70, 71, 72, 73, 437, 723, 809, 60, 61, 63, 64, 69, 424, 433, 438", eleitores: 3307, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Luzia Nunes Fernandes", localidade: "Nova Marabá Centro VP8", numero: "05", secoes: "509, 519, 523, 527, 541, 545, 551, 565, 573, 102, 103, 104, 448", eleitores: 2745, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Luzia Nunes Fernandes", localidade: "Nova Marabá Centro VP8", numero: "06", secoes: "80, 81, 82, 83, 84, 85, 86, 87, 88, 422, 476", eleitores: 2079, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Luzia Nunes Fernandes", localidade: "Nova Marabá Centro VP8", numero: "07", secoes: "504, 517, 525, 584, 609, 678, 730, 802, 891", eleitores: 2729, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Luzia Nunes Fernandes", localidade: "Nova Marabá Centro VP8", numero: "08", secoes: "593, 613, 628, 687, 808, 742, 780, 841, 881, 89, 90, 91, 92, 93, 94, 95, 432", eleitores: 4325, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Inácio de Souza Moita", localidade: "Proximidades Km 06, PA 150", numero: "09", secoes: "310, 311, 312, 313, 470, 716, 768, 779, 799, 814, 853", eleitores: 3688, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Inácio de Souza Moita", localidade: "Proximidades Km 06, PA 150", numero: "10", secoes: "318, 319, 507, 554, 583, 676, 705, 761, 822, 897, 74, 75, 76, 77, 78, 79, 249", eleitores: 2332, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Inácio de Souza Moita", localidade: "Proximidades Km 06, PA 150", numero: "11", secoes: "785, 801, 842, 858, 863, 869, 875, 882, 888, 896", eleitores: 3537, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Inácio de Souza Moita", localidade: "Proximidades Km 06, PA 150", numero: "12", secoes: "597, 671, 743, 786, 846, 898, 595, 666, 712, 760, 788, 821", eleitores: 3633, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Silvino Santis", localidade: "Folha 33", numero: "13", secoes: "560, 580, 610, 849, 895, 660, 682, 702, 735, 870, 769, 784, 834", eleitores: 4082, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Salomé Carvalho", localidade: "Nova Marabá Folhas, 20, 16, 12 etc.", numero: "14", secoes: "96, 97, 98, 99, 100, 101, 415, 515, 775, 805, 854", eleitores: 3738, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Salomé Carvalho", localidade: "Nova Marabá Folhas, 20, 16, 12 etc.", numero: "15", secoes: "324, 325, 326, 327, 328, 329, 330, 331, 414, 806, 721, 758, 791, 837, 867, 892", eleitores: 4684, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Salomé Carvalho", localidade: "Nova Marabá Folhas, 20, 16, 12 etc.", numero: "16", secoes: "497, 508, 535, 543, 569, 626, 669, 696, 732, 774, 798, 839, 866", eleitores: 4124, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Salomé Carvalho", localidade: "Nova Marabá Folhas, 20, 16, 12 etc.", numero: "17", secoes: "592, 629, 667, 686, 707, 726, 767, 778, 803, 829, 861, 894, 864, 877, 900", eleitores: 123, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "José Cursino", localidade: "Proximdades Folha 10", numero: "18", secoes: "314, 315, 316, 317, 436, 485, 781, 820, 537, 563, 588", eleitores: 3391, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "José Cursino", localidade: "Proximdades Folha 10", numero: "19", secoes: "305, 306, 307, 420, 506, 675, 747, 783, 860", eleitores: 2351, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "José Cursino", localidade: "Proximdades Folha 10", numero: "20", secoes: "533, 562, 587, 753, 790, 890, 596, 630, 703, 766, 782, 871, 899", eleitores: 3417, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "José Alves de Carvalho", localidade: "Bairro Liberdade, Independência", numero: "21", secoes: "204, 205, 206, 207, 208, 209, 210, 211, 212", eleitores: 2734, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "José Alves de Carvalho", localidade: "Bairro Liberdade, Independência", numero: "22", secoes: "40, 41, 42, 43, 44, 45, 46, 47, 215, 221, 232, 244", eleitores: 3881, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "José Alves de Carvalho", localidade: "Bairro Liberdade, Independência", numero: "23", secoes: "48, 49, 50, 51, 52, 53, 54, 55, 56, 217, 231, 255", eleitores: 3710, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "José Alves de Carvalho", localidade: "Bairro Liberdade, Independência", numero: "24", secoes: "105, 106, 107, 108, 109, 260, 264, 261, 263, 309", eleitores: 2786, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Darcy Ribeiro", localidade: "Bom Planalto/Bairro da Paz", numero: "25", secoes: "162, 163, 164, 165, 166, 167, 168, 169, 233, 254, 276, 289", eleitores: 4185, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Darcy Ribeiro", localidade: "Bom Planalto/Bairro da Paz", numero: "26", secoes: "145, 147, 148, 170, 171, 172, 227, 241, 280, 292, 305, 311", eleitores: 3937, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Acy Barros", localidade: "INCRA/AMAPÁ", numero: "27", secoes: "79, 80, 81, 82, 83, 84, 85, 86, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192", eleitores: 2623, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Acy Barros", localidade: "INCRA/AMAPÁ", numero: "28", secoes: "193, 194, 195, 196, 197, 198, 199, 200, 121, 122, 123, 124, 125, 230, 294, 302", eleitores: 3464, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Basílio Miguel", localidade: "AMAPÁ", numero: "29", secoes: "75, 76, 77, 78, 229, 306", eleitores: 1556, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Maria das Graças Ribeiro de Souza", localidade: "Jardim união", numero: "30", secoes: "246, 262, 265, 285, 290, 296, 299, 300, 304, 73, 74, 278", eleitores: 4148, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "São José", localidade: "Exp. Cidade Nova", numero: "31", secoes: "57, 58, 253, 281", eleitores: 1167, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Geraldo Veloso", localidade: "Novo Horizonte", numero: "32", secoes: "87, 88, 89, 90, 91, 218, 219, 228, 237, 242, 251, 257, 272, 282", eleitores: 4362, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Geraldo Veloso", localidade: "Novo Horizonte", numero: "33", secoes: "100, 101, 102, 103, 104, 234, 256, 297, 303, 310", eleitores: 2975, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Geraldo Veloso", localidade: "Novo Horizonte", numero: "34", secoes: "293, 301, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120", eleitores: 2509, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Anísio Teixeira", localidade: "Cidade Nova", numero: "35", secoes: "92, 93, 94, 95, 96, 97, 98, 99", eleitores: 2309, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Anísio Teixeira", localidade: "Cidade Nova", numero: "36", secoes: "216, 220, 235, 284, 288, 295, 298", eleitores: 2629, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Anísio Teixeira", localidade: "Cidade Nova", numero: "37", secoes: "30, 31, 32, 33, 225, 245, 275, 287", eleitores: 2713, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Elinda Simplício Costa", localidade: "Laranjeiras", numero: "38", secoes: "136, 137, 138, 139, 140, 141, 142, 143, 144, 146", eleitores: 3072, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Elinda Simplício Costa", localidade: "Laranjeiras", numero: "39", secoes: "64, 65, 66, 67, 68, 69, 70, 71, 72, 250", eleitores: 3258, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Pedro Peres Fontenele", localidade: "Morada Nova", numero: "40", secoes: "156, 157, 158, 159, 434, 818, 868, 883, 166, 167, 168, 512", eleitores: 3086, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Pedro Peres Fontenele", localidade: "Morada Nova", numero: "41", secoes: "160, 161, 162, 163, 164, 165, 427, 787, 817, 856, 884", eleitores: 3363, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Pedro Peres Fontenele", localidade: "Morada Nova", numero: "42", secoes: "826, 893, 618, 532, 550, 586, 851, 878, 819", eleitores: 2138, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "São Félix", localidade: "São Félix", numero: "43", secoes: "154, 155, 435, 815, 873, 772, 824", eleitores: 1906, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "São Félix", localidade: "São Félix", numero: "44", secoes: "152, 153, 447, 555, 807, 880, 852, 872, 879, 887", eleitores: 2970, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Julieta Gomes Leitão", localidade: "Novo São Félix", numero: "45", secoes: "518, 526, 540, 614, 734, 773, 797, 859, 663, 836, 876, 889", eleitores: 3217, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Julieta Gomes Leitão", localidade: "Novo São Félix", numero: "46", secoes: "567, 582, 625, 714, 770, 776, 792, 816, 771, 810, 857, 874, 885", eleitores: 4059, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Raimundo Gomes", localidade: "Vila Brejo do Meio", numero: "47", secoes: "34, 35, 156, 157, 158, 159, 160, 161, 266", eleitores: 2051, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Rachel de Queiroz (Vila Patauá)", localidade: "Zona Rural", numero: "48", secoes: "720, 840, 561, 692, 795, 838, 796, 847", eleitores: 576, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Profª Maria das Neves (Vila Santa Fé)", localidade: "Zona Rural", numero: "49", secoes: "131, 132, 133, 134, 154, 155, 243, 36, 37, 38, 39, 181, 274, 247", eleitores: 2239, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Adelaide Molinari (Distrito Sororó)", localidade: "Zona Rural", numero: "50", secoes: "603, 668, 697, 725, 794, 844, 862, 886, 553, 601, 804, 604, 825, 718, 828, 848, 749, 845, 813, 831", eleitores: 4541, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Adão Machado (Vila Três Poderes)", localidade: "Zona Rural", numero: "51", secoes: "59, 60, 61, 226, 222, 267, 249, 268", eleitores: 1276, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Boa Esperança do Burgo - (Km 30)", localidade: "Zona Rural", numero: "52", secoes: "130", eleitores: 365, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Nagib Mutran (Vila Capistrano de Abreu)", localidade: "Zona Rural", numero: "53", secoes: "62, 128, 175, 176, 177, 178, 179, 180, 248, 258, 259, 307", eleitores: 2561, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Alto Bonito (Vila Alto Bonito)", localidade: "Zona Rural", numero: "54", secoes: "63, 223, 252, 27", eleitores: 451, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Faixa Linda (Vila União)", localidade: "Zona Rural", numero: "55", secoes: "153, 149, 150, 151, 152, 173, 174", eleitores: 1299, total_votacao: 0, eleicao_id: 1, finalizada: false)
    Urna.create!(escola: "Caminho da Liberda (Vila Josinópolis)", localidade: "Zona Rural", numero: "56", secoes: "126, 127, 129, 308, 135, 213, 214", eleitores: 1288, total_votacao: 0, eleicao_id: 1, finalizada: false)
    
puts "Urnas Cadastradas com Sucesso"

puts "Cadastrado os Candidatos"

    Candidato.create!(numero: "01", nome_campanha: "Junhão", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "02", nome_campanha: "Mario Lopes", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "03", nome_campanha: "Andreza Lobato", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "04", nome_campanha: "Pr. Lourival", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "05", nome_campanha: "Celso Araújo", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "06", nome_campanha: "Pastora Francy", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "07", nome_campanha: "Reuld", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "08", nome_campanha: "Neusa", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "09", nome_campanha: "Pastor Franklan", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "10", nome_campanha: "Soraia Torres", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "11", nome_campanha: "Maycon Lafaiete", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "12", nome_campanha: "Maria Eliene", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "13", nome_campanha: "Emídio Nunes", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "14", nome_campanha: "Tia Lina", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "15", nome_campanha: "Michel Athiê", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "16", nome_campanha: "Erik Pereira", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "17", nome_campanha: "Quelle do Lalá", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "18", nome_campanha: "Gleicy do KM-07", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "19", nome_campanha: "Antônio José", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "20", nome_campanha: "Jonas Lima", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "21", nome_campanha: "Santino de Jesus", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "22", nome_campanha: "Graciliano ao vivo", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "23", nome_campanha: "Ranys Almeida", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "24", nome_campanha: "Inoã Batista Osório", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "25", nome_campanha: "Iraceli Taveira", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "26", nome_campanha: "Suzi Sacramento", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "27", nome_campanha: "Paulo César", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "28", nome_campanha: "Eliane Sousa", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "29", nome_campanha: "Profª Cirlane", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "30", nome_campanha: "Luiza Luza", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "31", nome_campanha: "Profª Erli", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "32", nome_campanha: "Josane Feliciano", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "33", nome_campanha: "Regis", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "34", nome_campanha: "Georgetown", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "35", nome_campanha: "Profª Caline Nunes", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "36", nome_campanha: "Elza Oliveira", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "37", nome_campanha: "Francisco Alves", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "38", nome_campanha: "Luma Silva", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "39", nome_campanha: "Sidinis", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "40", nome_campanha: "Vânia da 28", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "41", nome_campanha: "Aida da fl.35", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "42", nome_campanha: "Beto Jamaica", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "43", nome_campanha: "Joaci Ribeiro", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "44", nome_campanha: "Juscelino Souza", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "45", nome_campanha: "Karine Mendonça", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "46", nome_campanha: "Shirlei", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "47", nome_campanha: "Gilda Freitas", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "48", nome_campanha: "Darcy do KM 07", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "49", nome_campanha: "Francerli Cavalcante", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "50", nome_campanha: "Ismael", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "51", nome_campanha: "Jusceli Sales Guimarães", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "52", nome_campanha: "Nicolas", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "53", nome_campanha: "Suze Andreia", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "54", nome_campanha: "Civaldo Rodrigues", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "55", nome_campanha: "Gersica Borges", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "56", nome_campanha: "Eduardo Amoury", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "57", nome_campanha: "Edilza", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "58", nome_campanha: "Euro Sem Fronteiras", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "59", nome_campanha: "Edivaldo Santos", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "98", nome_campanha: "BRANCOS", nome_completo: "", eleicao_id: 1)
    Candidato.create!(numero: "99", nome_campanha: "NULOS", nome_completo: "", eleicao_id: 1)
                 
puts "Candidatos Cadastrados com Sucesso"