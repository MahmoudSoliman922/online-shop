import { get } from '../../utils/requests-methods';

export const getAllOffers = () => {
    return get('/api/v1/offers');
};

export const getPaginatedOffers = (page) => {
    return get(`/api/v1/offers/paginated_index?page=${page}`);
};

export const getFilteredOffers = (filters) => {
    return get(`/api/v1/offers`, filters);
};