___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.

___INFO___

{
  "type": "MACRO",
  "id": "country_normalizer",
  "version": 1,
  "securityGroups": [],
  "displayName": "Country Normalizer",
  "description": "Converts country names to ISO 3166-1 alpha-2 codes (lowercase) for server-side tracking. Supports 195+ countries with native language variants.",
  "containerContexts": [
    "SERVER",
    "WEB"
  ],
  "categories": ["UTILITY"],
  "brand": {
    "id": "metryxstudio",
    "displayName": "Metryx Studio"
  }
}

___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "rawCountry",
    "displayName": "Raw Country",
    "simpleValueType": true,
    "help": "Country name or ISO code in its original form (e.g., 'Croatia', 'HR', 'United States', 'US')."
  }
]

___SANDBOXED_JS_FOR_SERVER___

var makeString = require('makeString');

var normalizeCountry = function(data) {
  var rawCountry = data.rawCountry;

  if (!rawCountry) {
    return undefined;
  }

  var countryString = makeString(rawCountry).trim().toLowerCase();
  
  if (countryString.length === 0) {
    return undefined;
  }
  
  var countryNameToCode = {
    'albania': 'al', 'shqipëria': 'al', 'shqiperia': 'al',
    'andorra': 'ad',
    'armenia': 'am', 'hayastan': 'am',
    'austria': 'at', 'österreich': 'at', 'osterreich': 'at',
    'azerbaijan': 'az', 'azərbaycan': 'az', 'azerbaycan': 'az',
    'belarus': 'by', 'беларусь': 'by',
    'belgium': 'be', 'belgië': 'be', 'belgique': 'be', 'belgien': 'be',
    'bosnia and herzegovina': 'ba', 'bosnia': 'ba', 'bosna i hercegovina': 'ba',
    'bulgaria': 'bg', 'българия': 'bg',
    'croatia': 'hr', 'hrvatska': 'hr',
    'cyprus': 'cy', 'κύπρος': 'cy', 'kıbrıs': 'cy',
    'czech republic': 'cz', 'czechia': 'cz', 'česko': 'cz', 'cesko': 'cz',
    'denmark': 'dk', 'danmark': 'dk',
    'estonia': 'ee', 'eesti': 'ee',
    'finland': 'fi', 'suomi': 'fi',
    'france': 'fr',
    'georgia': 'ge', 'საქართველო': 'ge',
    'germany': 'de', 'deutschland': 'de',
    'greece': 'gr', 'ελλάδα': 'gr', 'ellada': 'gr',
    'hungary': 'hu', 'magyarország': 'hu', 'magyarorszag': 'hu',
    'iceland': 'is', 'ísland': 'is', 'island': 'is',
    'ireland': 'ie', 'éire': 'ie', 'eire': 'ie',
    'italy': 'it', 'italia': 'it',
    'kosovo': 'xk', 'kosova': 'xk', 'косово': 'xk',
    'latvia': 'lv', 'latvija': 'lv',
    'liechtenstein': 'li',
    'lithuania': 'lt', 'lietuva': 'lt',
    'luxembourg': 'lu', 'lëtzebuerg': 'lu', 'letzebuerg': 'lu',
    'malta': 'mt',
    'moldova': 'md',
    'monaco': 'mc',
    'montenegro': 'me', 'crna gora': 'me', 'црна гора': 'me',
    'netherlands': 'nl', 'nederland': 'nl', 'holland': 'nl',
    'north macedonia': 'mk', 'macedonia': 'mk', 'северна македонија': 'mk',
    'norway': 'no', 'norge': 'no', 'noreg': 'no',
    'poland': 'pl', 'polska': 'pl',
    'portugal': 'pt',
    'romania': 'ro', 'românia': 'ro',
    'russia': 'ru', 'rossiya': 'ru', 'россия': 'ru', 'russian federation': 'ru',
    'san marino': 'sm',
    'serbia': 'rs', 'srbija': 'rs', 'србија': 'rs',
    'slovakia': 'sk', 'slovensko': 'sk',
    'slovenia': 'si', 'slovenija': 'si',
    'spain': 'es', 'españa': 'es', 'espana': 'es',
    'sweden': 'se', 'sverige': 'se',
    'switzerland': 'ch', 'schweiz': 'ch', 'suisse': 'ch', 'svizzera': 'ch',
    'turkey': 'tr', 'türkiye': 'tr', 'turkiye': 'tr',
    'ukraine': 'ua', 'україна': 'ua', 'ukraina': 'ua',
    'united kingdom': 'gb', 'uk': 'gb', 'great britain': 'gb', 'britain': 'gb', 'england': 'gb', 'scotland': 'gb', 'wales': 'gb',
    'vatican city': 'va', 'holy see': 'va',
    'afghanistan': 'af',
    'bahrain': 'bh',
    'bangladesh': 'bd',
    'bhutan': 'bt',
    'brunei': 'bn', 'brunei darussalam': 'bn',
    'cambodia': 'kh', 'kampuchea': 'kh',
    'china': 'cn', 'peoples republic of china': 'cn', 'prc': 'cn',
    'india': 'in', 'bharat': 'in',
    'indonesia': 'id',
    'iran': 'ir', 'islamic republic of iran': 'ir',
    'iraq': 'iq',
    'israel': 'il',
    'japan': 'jp', 'nippon': 'jp', 'nihon': 'jp',
    'jordan': 'jo',
    'kazakhstan': 'kz',
    'kuwait': 'kw',
    'kyrgyzstan': 'kg',
    'laos': 'la', 'lao': 'la',
    'lebanon': 'lb',
    'malaysia': 'my',
    'maldives': 'mv',
    'mongolia': 'mn',
    'myanmar': 'mm', 'burma': 'mm',
    'nepal': 'np',
    'north korea': 'kp', 'dprk': 'kp',
    'oman': 'om',
    'pakistan': 'pk',
    'palestine': 'ps', 'state of palestine': 'ps',
    'philippines': 'ph',
    'qatar': 'qa',
    'saudi arabia': 'sa',
    'singapore': 'sg',
    'south korea': 'kr', 'korea': 'kr', 'republic of korea': 'kr',
    'sri lanka': 'lk',
    'syria': 'sy', 'syrian arab republic': 'sy',
    'taiwan': 'tw', 'republic of china': 'tw',
    'tajikistan': 'tj',
    'thailand': 'th',
    'timor-leste': 'tl', 'east timor': 'tl',
    'turkmenistan': 'tm',
    'united arab emirates': 'ae', 'uae': 'ae', 'emirates': 'ae',
    'uzbekistan': 'uz',
    'vietnam': 'vn', 'viet nam': 'vn',
    'yemen': 'ye',
    'hong kong': 'hk',
    'macau': 'mo', 'macao': 'mo',
    'algeria': 'dz',
    'angola': 'ao',
    'benin': 'bj',
    'botswana': 'bw',
    'burkina faso': 'bf',
    'burundi': 'bi',
    'cameroon': 'cm', 'cameroun': 'cm',
    'cape verde': 'cv', 'cabo verde': 'cv',
    'central african republic': 'cf',
    'chad': 'td', 'tchad': 'td',
    'comoros': 'km',
    'congo': 'cg', 'republic of the congo': 'cg',
    'democratic republic of the congo': 'cd', 'dr congo': 'cd', 'drc': 'cd', 'congo-kinshasa': 'cd',
    'djibouti': 'dj',
    'egypt': 'eg',
    'equatorial guinea': 'gq',
    'eritrea': 'er',
    'eswatini': 'sz', 'swaziland': 'sz',
    'ethiopia': 'et',
    'gabon': 'ga',
    'gambia': 'gm', 'the gambia': 'gm',
    'ghana': 'gh',
    'guinea': 'gn',
    'guinea-bissau': 'gw',
    'ivory coast': 'ci', 'cote divoire': 'ci', 'côte divoire': 'ci',
    'kenya': 'ke',
    'lesotho': 'ls',
    'liberia': 'lr',
    'libya': 'ly',
    'madagascar': 'mg',
    'malawi': 'mw',
    'mali': 'ml',
    'mauritania': 'mr',
    'mauritius': 'mu',
    'morocco': 'ma', 'maroc': 'ma',
    'mozambique': 'mz', 'moçambique': 'mz', 'mocambique': 'mz',
    'namibia': 'na',
    'niger': 'ne',
    'nigeria': 'ng',
    'rwanda': 'rw',
    'sao tome and principe': 'st', 'são tomé and príncipe': 'st',
    'senegal': 'sn', 'sénégal': 'sn',
    'seychelles': 'sc',
    'sierra leone': 'sl',
    'somalia': 'so',
    'south africa': 'za',
    'south sudan': 'ss',
    'sudan': 'sd',
    'tanzania': 'tz',
    'togo': 'tg',
    'tunisia': 'tn', 'tunisie': 'tn',
    'uganda': 'ug',
    'zambia': 'zm',
    'zimbabwe': 'zw',
    'canada': 'ca',
    'mexico': 'mx', 'méxico': 'mx', 'mexiko': 'mx',
    'united states': 'us', 'united states of america': 'us', 'usa': 'us', 'america': 'us', 'u.s.': 'us', 'u.s.a.': 'us',
    'antigua and barbuda': 'ag',
    'bahamas': 'bs', 'the bahamas': 'bs',
    'barbados': 'bb',
    'belize': 'bz',
    'costa rica': 'cr',
    'cuba': 'cu',
    'dominica': 'dm',
    'dominican republic': 'do',
    'el salvador': 'sv',
    'grenada': 'gd',
    'guatemala': 'gt',
    'haiti': 'ht', 'haïti': 'ht',
    'honduras': 'hn',
    'jamaica': 'jm',
    'nicaragua': 'ni',
    'panama': 'pa', 'panamá': 'pa',
    'saint kitts and nevis': 'kn',
    'saint lucia': 'lc',
    'saint vincent and the grenadines': 'vc',
    'trinidad and tobago': 'tt',
    'argentina': 'ar',
    'bolivia': 'bo',
    'brazil': 'br', 'brasil': 'br',
    'chile': 'cl',
    'colombia': 'co',
    'ecuador': 'ec',
    'guyana': 'gy',
    'paraguay': 'py',
    'peru': 'pe', 'perú': 'pe',
    'suriname': 'sr',
    'uruguay': 'uy',
    'venezuela': 've',
    'australia': 'au',
    'fiji': 'fj',
    'kiribati': 'ki',
    'marshall islands': 'mh',
    'micronesia': 'fm', 'federated states of micronesia': 'fm',
    'nauru': 'nr',
    'new zealand': 'nz',
    'palau': 'pw',
    'papua new guinea': 'pg',
    'samoa': 'ws',
    'solomon islands': 'sb',
    'tonga': 'to',
    'tuvalu': 'tv',
    'vanuatu': 'vu'
  };
  
  if (countryString.length === 2) {
    var char1 = countryString.charAt(0);
    var char2 = countryString.charAt(1);
    if ((char1 >= 'a' && char1 <= 'z') && (char2 >= 'a' && char2 <= 'z')) {
      return countryString;
    }
  }
  
  if (countryNameToCode[countryString]) {
    return countryNameToCode[countryString];
  }
  
  return undefined;
};

return normalizeCountry(data);


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

var makeString = require('makeString');

var normalizeCountry = function(data) {
  var rawCountry = data.rawCountry;

  if (!rawCountry) {
    return undefined;
  }

  var countryString = makeString(rawCountry).trim().toLowerCase();
  
  if (countryString.length === 0) {
    return undefined;
  }
  
  var countryNameToCode = {
    'albania': 'al', 'shqipëria': 'al', 'shqiperia': 'al',
    'andorra': 'ad',
    'armenia': 'am', 'hayastan': 'am',
    'austria': 'at', 'österreich': 'at', 'osterreich': 'at',
    'azerbaijan': 'az', 'azərbaycan': 'az', 'azerbaycan': 'az',
    'belarus': 'by', 'беларусь': 'by',
    'belgium': 'be', 'belgië': 'be', 'belgique': 'be', 'belgien': 'be',
    'bosnia and herzegovina': 'ba', 'bosnia': 'ba', 'bosna i hercegovina': 'ba',
    'bulgaria': 'bg', 'българия': 'bg',
    'croatia': 'hr', 'hrvatska': 'hr',
    'cyprus': 'cy', 'κύπρος': 'cy', 'kıbrıs': 'cy',
    'czech republic': 'cz', 'czechia': 'cz', 'česko': 'cz', 'cesko': 'cz',
    'denmark': 'dk', 'danmark': 'dk',
    'estonia': 'ee', 'eesti': 'ee',
    'finland': 'fi', 'suomi': 'fi',
    'france': 'fr',
    'georgia': 'ge', 'საქართველო': 'ge',
    'germany': 'de', 'deutschland': 'de',
    'greece': 'gr', 'ελλάδα': 'gr', 'ellada': 'gr',
    'hungary': 'hu', 'magyarország': 'hu', 'magyarorszag': 'hu',
    'iceland': 'is', 'ísland': 'is', 'island': 'is',
    'ireland': 'ie', 'éire': 'ie', 'eire': 'ie',
    'italy': 'it', 'italia': 'it',
    'kosovo': 'xk', 'kosova': 'xk', 'косово': 'xk',
    'latvia': 'lv', 'latvija': 'lv',
    'liechtenstein': 'li',
    'lithuania': 'lt', 'lietuva': 'lt',
    'luxembourg': 'lu', 'lëtzebuerg': 'lu', 'letzebuerg': 'lu',
    'malta': 'mt',
    'moldova': 'md',
    'monaco': 'mc',
    'montenegro': 'me', 'crna gora': 'me', 'црна гора': 'me',
    'netherlands': 'nl', 'nederland': 'nl', 'holland': 'nl',
    'north macedonia': 'mk', 'macedonia': 'mk', 'северна македонија': 'mk',
    'norway': 'no', 'norge': 'no', 'noreg': 'no',
    'poland': 'pl', 'polska': 'pl',
    'portugal': 'pt',
    'romania': 'ro', 'românia': 'ro',
    'russia': 'ru', 'rossiya': 'ru', 'россия': 'ru', 'russian federation': 'ru',
    'san marino': 'sm',
    'serbia': 'rs', 'srbija': 'rs', 'србија': 'rs',
    'slovakia': 'sk', 'slovensko': 'sk',
    'slovenia': 'si', 'slovenija': 'si',
    'spain': 'es', 'españa': 'es', 'espana': 'es',
    'sweden': 'se', 'sverige': 'se',
    'switzerland': 'ch', 'schweiz': 'ch', 'suisse': 'ch', 'svizzera': 'ch',
    'turkey': 'tr', 'türkiye': 'tr', 'turkiye': 'tr',
    'ukraine': 'ua', 'україна': 'ua', 'ukraina': 'ua',
    'united kingdom': 'gb', 'uk': 'gb', 'great britain': 'gb', 'britain': 'gb', 'england': 'gb', 'scotland': 'gb', 'wales': 'gb',
    'vatican city': 'va', 'holy see': 'va',
    'afghanistan': 'af',
    'bahrain': 'bh',
    'bangladesh': 'bd',
    'bhutan': 'bt',
    'brunei': 'bn', 'brunei darussalam': 'bn',
    'cambodia': 'kh', 'kampuchea': 'kh',
    'china': 'cn', 'peoples republic of china': 'cn', 'prc': 'cn',
    'india': 'in', 'bharat': 'in',
    'indonesia': 'id',
    'iran': 'ir', 'islamic republic of iran': 'ir',
    'iraq': 'iq',
    'israel': 'il',
    'japan': 'jp', 'nippon': 'jp', 'nihon': 'jp',
    'jordan': 'jo',
    'kazakhstan': 'kz',
    'kuwait': 'kw',
    'kyrgyzstan': 'kg',
    'laos': 'la', 'lao': 'la',
    'lebanon': 'lb',
    'malaysia': 'my',
    'maldives': 'mv',
    'mongolia': 'mn',
    'myanmar': 'mm', 'burma': 'mm',
    'nepal': 'np',
    'north korea': 'kp', 'dprk': 'kp',
    'oman': 'om',
    'pakistan': 'pk',
    'palestine': 'ps', 'state of palestine': 'ps',
    'philippines': 'ph',
    'qatar': 'qa',
    'saudi arabia': 'sa',
    'singapore': 'sg',
    'south korea': 'kr', 'korea': 'kr', 'republic of korea': 'kr',
    'sri lanka': 'lk',
    'syria': 'sy', 'syrian arab republic': 'sy',
    'taiwan': 'tw', 'republic of china': 'tw',
    'tajikistan': 'tj',
    'thailand': 'th',
    'timor-leste': 'tl', 'east timor': 'tl',
    'turkmenistan': 'tm',
    'united arab emirates': 'ae', 'uae': 'ae', 'emirates': 'ae',
    'uzbekistan': 'uz',
    'vietnam': 'vn', 'viet nam': 'vn',
    'yemen': 'ye',
    'hong kong': 'hk',
    'macau': 'mo', 'macao': 'mo',
    'algeria': 'dz',
    'angola': 'ao',
    'benin': 'bj',
    'botswana': 'bw',
    'burkina faso': 'bf',
    'burundi': 'bi',
    'cameroon': 'cm', 'cameroun': 'cm',
    'cape verde': 'cv', 'cabo verde': 'cv',
    'central african republic': 'cf',
    'chad': 'td', 'tchad': 'td',
    'comoros': 'km',
    'congo': 'cg', 'republic of the congo': 'cg',
    'democratic republic of the congo': 'cd', 'dr congo': 'cd', 'drc': 'cd', 'congo-kinshasa': 'cd',
    'djibouti': 'dj',
    'egypt': 'eg',
    'equatorial guinea': 'gq',
    'eritrea': 'er',
    'eswatini': 'sz', 'swaziland': 'sz',
    'ethiopia': 'et',
    'gabon': 'ga',
    'gambia': 'gm', 'the gambia': 'gm',
    'ghana': 'gh',
    'guinea': 'gn',
    'guinea-bissau': 'gw',
    'ivory coast': 'ci', 'cote divoire': 'ci', 'côte divoire': 'ci',
    'kenya': 'ke',
    'lesotho': 'ls',
    'liberia': 'lr',
    'libya': 'ly',
    'madagascar': 'mg',
    'malawi': 'mw',
    'mali': 'ml',
    'mauritania': 'mr',
    'mauritius': 'mu',
    'morocco': 'ma', 'maroc': 'ma',
    'mozambique': 'mz', 'moçambique': 'mz', 'mocambique': 'mz',
    'namibia': 'na',
    'niger': 'ne',
    'nigeria': 'ng',
    'rwanda': 'rw',
    'sao tome and principe': 'st', 'são tomé and príncipe': 'st',
    'senegal': 'sn', 'sénégal': 'sn',
    'seychelles': 'sc',
    'sierra leone': 'sl',
    'somalia': 'so',
    'south africa': 'za',
    'south sudan': 'ss',
    'sudan': 'sd',
    'tanzania': 'tz',
    'togo': 'tg',
    'tunisia': 'tn', 'tunisie': 'tn',
    'uganda': 'ug',
    'zambia': 'zm',
    'zimbabwe': 'zw',
    'canada': 'ca',
    'mexico': 'mx', 'méxico': 'mx', 'mexiko': 'mx',
    'united states': 'us', 'united states of america': 'us', 'usa': 'us', 'america': 'us', 'u.s.': 'us', 'u.s.a.': 'us',
    'antigua and barbuda': 'ag',
    'bahamas': 'bs', 'the bahamas': 'bs',
    'barbados': 'bb',
    'belize': 'bz',
    'costa rica': 'cr',
    'cuba': 'cu',
    'dominica': 'dm',
    'dominican republic': 'do',
    'el salvador': 'sv',
    'grenada': 'gd',
    'guatemala': 'gt',
    'haiti': 'ht', 'haïti': 'ht',
    'honduras': 'hn',
    'jamaica': 'jm',
    'nicaragua': 'ni',
    'panama': 'pa', 'panamá': 'pa',
    'saint kitts and nevis': 'kn',
    'saint lucia': 'lc',
    'saint vincent and the grenadines': 'vc',
    'trinidad and tobago': 'tt',
    'argentina': 'ar',
    'bolivia': 'bo',
    'brazil': 'br', 'brasil': 'br',
    'chile': 'cl',
    'colombia': 'co',
    'ecuador': 'ec',
    'guyana': 'gy',
    'paraguay': 'py',
    'peru': 'pe', 'perú': 'pe',
    'suriname': 'sr',
    'uruguay': 'uy',
    'venezuela': 've',
    'australia': 'au',
    'fiji': 'fj',
    'kiribati': 'ki',
    'marshall islands': 'mh',
    'micronesia': 'fm', 'federated states of micronesia': 'fm',
    'nauru': 'nr',
    'new zealand': 'nz',
    'palau': 'pw',
    'papua new guinea': 'pg',
    'samoa': 'ws',
    'solomon islands': 'sb',
    'tonga': 'to',
    'tuvalu': 'tv',
    'vanuatu': 'vu'
  };
  
  if (countryString.length === 2) {
    var char1 = countryString.charAt(0);
    var char2 = countryString.charAt(1);
    if ((char1 >= 'a' && char1 <= 'z') && (char2 >= 'a' && char2 <= 'z')) {
      return countryString;
    }
  }
  
  if (countryNameToCode[countryString]) {
    return countryNameToCode[countryString];
  }
  
  return undefined;
};

return normalizeCountry(data);



___WEB_PERMISSIONS___

[]


___SERVER_PERMISSIONS___

[]


___TESTS___

scenarios:
- name: Croatia full name
  code: |-
    const mockData = {
      rawCountry: 'Croatia'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('hr');
- name: Hrvatska native name
  code: |-
    const mockData = {
      rawCountry: 'Hrvatska'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('hr');
- name: HR ISO code
  code: |-
    const mockData = {
      rawCountry: 'HR'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('hr');
- name: United States
  code: |-
    const mockData = {
      rawCountry: 'United States'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('us');
- name: USA abbreviation
  code: |-
    const mockData = {
      rawCountry: 'USA'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('us');
- name: Germany
  code: |-
    const mockData = {
      rawCountry: 'Germany'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('de');
- name: United Kingdom
  code: |-
    const mockData = {
      rawCountry: 'United Kingdom'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('gb');
- name: UK abbreviation maps to GB
  code: |-
    const mockData = {
      rawCountry: 'UK'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('gb');
- name: Empty input returns undefined
  code: |-
    const mockData = {
      rawCountry: ''
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo(undefined);
- name: Non-existent country returns undefined
  code: |-
    const mockData = {
      rawCountry: 'Atlantis'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo(undefined);
- name: Undefined input returns undefined
  code: |-
    const mockData = {};
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo(undefined);
- name: Japan
  code: |-
    const mockData = {
      rawCountry: 'Japan'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('jp');
- name: South Korea
  code: |-
    const mockData = {
      rawCountry: 'South Korea'
    };
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo('kr');
