module CdtBaas
  
  #envs
  HOMOLOGATION = "hml"
  PRODUCTION = "prd"
  CUSTOM_AUTH = "prdbr"

  #urls
  URL_HML = "https://api.hml.caradhras.io/"
  URL_PRD = "https://api.caradhras.io/"
  URL_CUSTOM_AUTH = "https://api.caradhras.io/"

  #auth_url
  TOKEN_HML = "https://auth.hml.caradhras.io/"
  TOKEN_PRD = "https://auth.caradhras.io/"
  TOKEN_DOCKNITO_HML = "https://auth2.hml.caradhras.io/"
  TOKEN_DOCKNITO_PRD = "https://auth2.caradhras.io/"

  #custom_auth
  TOKEN_CUSTOM_AUTH = ENV["CUSTOM_AUTH_URL"]
  CUSTOM_AUTH_USER = ENV["CUSTOM_AUTH_USER"]
  CUSTOM_AUTH_PASSWORD = ENV["CUSTOM_AUTH_PASS"]


  API = "api/"
  TOKEN_PATH = "oauth2/token?grant_type=client_credentials"
  TOKEN_DOCKNITO_PATH = "token?grant_type=client_credentials"
  DETAILS = "details"
  RATE = "rate/"
  ACCOUNT = "account/"
  PEOPLE_PATH = "pessoas"
  PEOPLE_DETAILS_PATH = "pessoas-detalhes"
  ZIP_PATH = "ceps"
  ADDRESSES_PATH = "enderecos"
  PHONES_PATH = "telefones"
  INVOICES_PATH = "boletos"
  INVOICE_REGISTER_PATH = "registrar"
  INVOICE_PRINT_PATH = "arquivo.pdf"
  PDF = "pdf"
  NEW_ACCOUNT_PATH = "accounts/"
  ACCOUNT_PATH = "contas"
  TIMELINE_PATH = "timeline"
  TRANSACTIONS_PATH = "transacoes"
  NEW_TRANSACTIONS_PATH = "transactions"
  ACTIVE_PATH = "reativar"
  BLOCKED_PATH = "bloquear"
  CANCEL_PATH = "cancelar"
  ADDITIONAL = "/additional"
  CARD_PATH = "gerar-cartao-grafica"
  VIRTUAL_CARD_PATH = "gerar-cartao-virtual"
  BANK_SLIP_PATH = "gerar-boleto-recarga"
  P2P_PATH = "p2ptransfer"
  V1_PAYMENT = "v1/payments"
  PAYMENT = "payments/"
  PAYMENT_VALIDATE = "payments/validate/"
  VALIDATE = "validate/"
  P2P_ADJUSTMENT = "p2ptransfer/adjustment/"
  PAYMENT_ADJUSTMENT = "payments/adjustment/"
  BANK_SLIP = "boletos"
  CARD_PLAIN = "cartoes"
  CARD = "cartoes/"
  CARD_CONSULT = "consultar-dados-reais"
  PASSWORD_VALIDATION = "validar-senha"
  LIMIT_CONSULT = "limites-disponibilidades"
  CREATE_PF_CARD = "gerar-cartao-pf"
  CREATE_PJ_CARD = "gerar-cartao-pj"
  CREATE_NEW_CARD = "gerar-nova-via"
  UNLOCKED_INCORRECT_PASSWORD = "desbloquear-senha-incorreta"
  CREATE_DEBIT_CARD = "gerar-Cartao-pre-pago"
  REGISTER_PASSWORD = "cadastrar-senha"
  UNLOCKED = "desbloquear"
  ADD_HOLDER = "atribuir-titular"
  UPDATE_PASSWORD = "alterar-senha"
  REGISTER_PF_ACCOUNT = "clientes/pf"
  REGISTER_PJ_ACCOUNT = "clientes/pj"
  GENERATE_DOCUMENT = "generatedocument"
  BANK_TRANSFER = "banktransfers"
  BANK_TRANSFER_ADJUST = "banktransfers/adjustment/"
  TRANSPORT_CARDS = "transportcards/card/"
  TRANSPORT_CARDS_RECHARGE = "transportcards/recharge"
  TRANSPORT_CARDS_ACCOUNT = "transportcards/account/"
  RECHARGES = "recharges"
  DEALERS = "dealers"
  CONFIRM = "confirm"
  CONSULT = "consult/"
  ADJUSTMENT = "adjustment/"
  REGISTRATION = "registration/"
  REGISTRATION_WITH_TYPES = "?types=PRIVACY_POLICY&types=TERMS_OF_USE"
  AGREEMENT = "agreement"
  USER = "user"
  LOGIN = "login"
  ASSIGN_PROFILE = "assign-profile/"
  UNASSIGN_PROFILE = "unassign-profile/"
  PRE_PAID = "lotes-cartoes-pre-pagos"
  BILLET = "billet"
  CARRIER_DETAILS = "carrier-details"
  CARRIER = "carrier"
  CALCULATE = "calculate"
  CEPS = "ceps"
  WAIVED = "rate/waived"
  KYC = "knowyourclient/people"
  PRODUCTS_PATH = "produtos"
  INDIVIDUALS = "individuals"
  REGISTRATIONS = "registrations"
  COMPANY_REGISTRATIONS = "registered/companies"
  COMPANY_NATIONAL_REGISTRATIONS = "registrations/nationalRegistration"
  INDIVIDUALS_ACCOUNTS = "individuals/accounts"
  SMS_PATH = "omnichannel/sms"
  RECEIPTS = "receipts"
  SCHEDULER = "scheduler"
  ALIAS_BANK = "v1/accounts"
  PAYMENT_SLIP_RECHARGE = "recharge"
  PAYMENT_SLIP_INVOICE = "invoice"
  ADD_NONAME_TO_ACCOUNT = "atribuir-cartao-prepago"
  DOCSPY_DOCUMENTS = "docspy/documents"
  DOCSPY_SELFIES = "docspy/selfies"
  DOCSPY_DOCUMENTS_RULES = "docspy/documents/rules"
  DOCSPY_SELFIES_RULES = "docspy/selfies/rules"
  DOCUMENTS = "documents"
  CONTROLS_LIMITS = "/controles-limites"
  CREATE_TEMPORARY_CARD = '/gerar-cartao-provisorio'
  CONTROLS_SETTINGS = 'controles-configuracoes'
  REPORTS = 'reports'
  REQUESTS = 'requests'

  CONFIRM_ORDER = '/confirm'
  CREATE_ORDER = '/create'
  MERCHANTS = '/merchants'

  CHANGE_CARD_PHASE = '/alterar-estagio'
  UPDATE_MAILING_ADDRESS = '/alterar-endereco-correspondencia'

  #pix
  CHECK_KEYS = "dict/v1/validate"
  CREATE_KEY = "dict/v1"
  CLAIM_KEY = "dict/v1/claim-key"
  CLAIM_KEY_CONFIRMATION = "dict/v1/claim-key/confirmation"

  STATIC_CODE = "code/v1/static-code"
  DYNAMIC_CODE = "code/v1/dynamic-code"
  DECODE_CODE = "code/v1/decode"
  LIST_CODES = "code/v1"

  PAY_PIX = "transfers/v1"
  LIST_PIX = "transfers/v1/receipts"
  LIST_PIX_REVERSAL = "transfers/v1/reversal/receipts"
  CANCEL_PIX = "transfers/v1/reversal"
  PIX_RECEIPT = 'status'
  PIX_RECEIPT_REVERSAL = 'reversal'

  DOWNLOAD = 'download'
  DOCSPY_DOCUMENTS_V1 = 'docspy/v1/documents'
end
