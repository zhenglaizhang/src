/*
 * ObjectPool.h
 *
 *  Created on: Jul 31, 2015
 *      Author: Darin
 */

#ifndef SRC_OBJECTPOOL_H_
#define SRC_OBJECTPOOL_H_

#include <cstddef>
#include <queue>
#include <stdexcept>
#include <memory>

namespace meow {

template <typename T>
class ObjectPool {
public:
	ObjectPool(size_t chunkSize = DefaultChunkSize);
	ObjectPool(const ObjectPool<T>&) = delete;
	ObjectPool<T>& operator=(const ObjectPool<T>&) = delete;

	using Object = std::shared_ptr<T>;

	Object acquireObject();

private:
	std::queue<std::shared_ptr<T> > freeList;
	size_t chunkSize;
	static const size_t DefaultChunkSize = 10;
	void allocateChunk();
};


template <typename T>
void ObjectPool<T>::allocateChunk()
{
	for (size_t i = 0; i < chunkSize; ++i)
	{
		freeList.emplace(std::make_shared<T>());
	}
}

//template <typename T>
//ObjectPool<T>::Object acquireObject()
//{
//
//}

} /* namespace my */

#endif /* SRC_OBJECTPOOL_H_ */
