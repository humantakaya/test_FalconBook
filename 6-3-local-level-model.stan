data {
  int n_sample;       // �T���v���T�C�Y
  real y[n_sample];   // �ϑ��l
}

parameters {
  real mu_zero;       // ��Ԃ̏����l
  real mu[n_sample];  // ��Ԃ̐���l
  real<lower=0> s_w;  // �ߒ��덷�̕��U
  real<lower=0> s_v;  // �ϑ��덷�̕��U
}

model {
  // ��Ԃ̏����l����ŏ��̎��_�̏�Ԃ�������
  mu[1] ~ normal(mu_zero, sqrt(s_w));  
  
  // ��ԕ������ɏ]���A��Ԃ��J�ڂ���
  for(i in 2:n_sample) {
    mu[i] ~ normal(mu[i-1], sqrt(s_w));
  }
  
  // �ϑ��������ɏ]���A�ϑ��l��������
  for(i in 1:n_sample) {
    y[i] ~ normal(mu[i], sqrt(s_v));
  }
}

