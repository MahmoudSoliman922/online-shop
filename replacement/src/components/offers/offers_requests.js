import { get } from '../../utils/requests-methods';

export const getAllOffers = () => {
  return get('/api/v1/offers');
};

export const getPaginatedOffers = page => {
  return get(`/api/v1/offers/paginated_index?page=${page}`);
};

export const getFilteredOffers = filters => {
  let url = '/api/v1/offers/paginated_filter?';
  url += filters.departement ? `departement=${filters.departement}&` : '';
  url += filters.promotion_active === true || filters.promotion_active === false ? `promotion_active=${filters.promotion_active}` : '';
  return get(url);
};
